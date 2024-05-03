---
title: Mysql HA Settings
date: 2023-11-09
weight: 4
---

This chapter introduces 2 solutions of how to achieve Mysql's HA:
- Mysql dual master and backup +keepalived(VIP) scheme
- PXC(Percona XtraDB Cluster) scheme

{{% alert title="Information" color="default" %}}
Besides the 2 solutions introduced in the chapter, you can achieve other Mysql's HA solutions, refer to [Introduction to Mysql's HA architectures](../../../reference/other/mysql-ha-solutions)
{{% /alert %}}


## 1.Mysql mutual master and backup + keepalived scheme

Requires 2 nodes, configure the 2 mysql instances as mutual masters/backups, such as:

|  Node  |  HostName  |        IP       |
|--------|------------|-----------------|
| ServerNode1  | server1.chime.com  | 192.168.231.11 |
| ServerNode2  | server2.chime.com  | 192.168.231.12 |

plus, install the start keepalived service on each node, and setup a VIP for exposing the mysql service, such as:

VIP: 192.168.231.30

##### 1.Configure the server2 to be synchronized with server1 via binlog

edit /etc/my.conf file on server1, add or modify the following content:

```
[mysqld]
server-id=1
log-bin=mysql-bin

#binlog only replicate database chime and portal
binlog-do-db=chime
binlog-do-db=portal
```

restart the mysqld process

```
sudo systemctl restart mysqld 
```

execute the SQLs on server1:

```
#mysql -u root -p 

CREATE USER 'chimesync'@'%' IDENTIFIED BY 'passw0rd';
GRANT REPLICATION SLAVE ON *.* TO 'chimesync'@'%';
FLUSH PRIVILEGES;
```

check the status of the binlong on the master Mysql: 

```
mysql> show master status \G
*************************** 1. row ***************************
             File: mysql-bin.000001
         Position: 156
     Binlog_Do_DB: 
 Binlog_Ignore_DB: 
Executed_Gtid_Set: 
1 row in set (0.00 sec)
```

execute SQLs on server2:

```
change master to master_host='192.168.231.11',master_user='chimesync',master_password='passw0rd',master_log_file='mysql-bin.000001',master_log_pos=156;
```

**Note**: the master_log_file and master_log_pos values must be same with the binlog values of the output of the command "show master status" invoked on the master Mysql.

##### 2.Configure the server1 to be synchronized with server2 via binlog

edit /etc/my.conf on server2, add or modify the following content:

```
[mysqld]
server-id=2
log-bin=mysql-bin

#binlog only replicate database chime and portal
binlog-do-db=chime
binlog-do-db=portal
```

restart the mysqld service:

```
sudo systemctl restart mysqld 
```

execute the SQLs on server2:

```
#mysql -u root -p 

CREATE USER 'chimesync'@'%' IDENTIFIED BY 'passw0rd';
GRANT REPLICATION SLAVE ON *.* TO 'chimesync'@'%';
FLUSH PRIVILEGES;
```

check the status of binlog on master mysql: 

```
mysql> show master status \G
*************************** 1. row ***************************
             File: mysql-bin.000001
         Position: 157
     Binlog_Do_DB: 
 Binlog_Ignore_DB: 
Executed_Gtid_Set: 
1 row in set (0.00 sec)
```

execute SQLs on server1:

```
change master to master_host='192.168.231.12',master_user='chimesync',master_password='passw0rd',master_log_file='mysql-bin.000001',master_log_pos=157;
```

**Note**: the master_log_file and master_log_pos values must be same with the binlog values of the output of the command "show master status" invoked on the master Mysql.


##### 3.Test binlog's mutual replications between server1 and server2

create test1/test2 table in the "chime" database on server1/server2 respectively 

```
#on server1: 
USE chime;
CREATE TABLE TEST1(id INT AUTO_INCREMENT PRIMARY KEY); 

#on server2: 
USE chime;
SHOW TABLES;
CREATE TABLE TEST2(id INT AUTO_INCREMENT PRIMARY KEY); 

#on server1: 
SHOW TABLES;
```

check the test1/test2 tables exist on both mysql instances

##### 4.Change master/slave setting

If need to change master/slave setting, you should stop the replications first, and change the master/slave setting and then restart the slave replication again, for instance:

```
STOP SLAVE;
change master to xxx xxx ... 
START SLAVE;
```

##### 5.keepalived configuration

edit /etc/keepalived/keepalived.conf file on server1, add or modify the following content:

```
vrrp_script chk_mysql {
    script "nc -zv localhost 3306"
    interval 2                # default: 1s
}

vrrp_instance VI_2 {
    state MASTER
    interface ens160
    virtual_router_id 52
    priority 255
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        192.168.231.30
    }

    track_script {
        chk_mysql
    }
}
```


edit /etc/keepalived/keepalived.conf file on server2, add or modify the following content:

```
vrrp_script chk_mysql {
    script "nc -zv localhost 3306"
    interval 2                   # default: 1s
}

vrrp_instance VI_2 {
    state BACKUP
    interface ens160
    virtual_router_id 52
    priority 254
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        192.168.231.30
    }

    track_script {
        chk_mysql
    }
}
```
restart the keepalived on server1 and server2 respectively

```
sudo systemctl restart keepalived
```

check the connectivity to mysql via VIP address: 

```
mysql -h 192.168.231.30 -u root -p
```

## 2.PXC(Percona XtraDB Cluster) scheme example

require 3 nodes, such as: 

|  Node  |  Host  |        IP       |
|--------|--------|-----------------|
| ServerNode1  | server1.chime.com  | 192.168.231.11 |
| ServerNode2  | server2.chime.com  | 192.168.231.12 |
| ServerNode3  | server3.chime.com  | 192.168.231.13 |

{{% alert title="Information" color="primary" %}}
It is not recommended to deploy Percona cluster with only 2 nodes even though it is feasible.
{{% /alert %}}

install percona on the 3 servers respectively:

```
sudo yum install https://repo.percona.com/yum/percona-release-latest.noarch.rpm
sudo percona-release setup pxc-80
sudo yum install percona-xtradb-cluster
```

edit mysql's configuration file of /etc/my.cnf on each server as following: 

```
# vim /etc/my.cnf
wsrep_provider=/usr/lib64/galera4/libgalera_smm.so
wsrep_cluster_name=pxc-cluster
wsrep_cluster_address=gcomm://192.168.231.11,192.168.231.12,192.168.231.13

[mysqld]
wsrep_provider_options=”socket.ssl_key=server-key.pem;socket.ssl_cert=server-cert.pem;socket.ssl_ca=ca.pem”

[sst]
encrypt=4
ssl-key=server-key.pem
ssl-ca=ca.pem
ssl-cert=server-cert.pem
```

add following content on server1:

```
wsrep_node_name=server1.chime.com
wsrep_node_address=192.168.231.11
pxc_strict_mode=ENFORCING
```

add following content on server2:

```
wsrep_node_name=server2.chime.com
wsrep_node_address=192.168.231.12
```

add following content on server3:

```
wsrep_node_name=server3.chime.com
wsrep_node_address=192.168.231.13
```

restart mysql on each server:

```
sudo systemctl stop mysql
sudo systemctl start mysql
```

check the status of Percona cluster:

```
show status like 'wsrep%';
```