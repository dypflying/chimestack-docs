---
title: mysql配置
date: 2023-11-09
weight: 4
---

本章将介绍两种不同的mysql高可用方案: 

- Mysql双主互为主备+keepalived(VIP)
- PXC(Percona XtraDB Cluster)配置

{{% alert title="提示" color="default" %}}
除了本章介绍的两种mysql高可用方案，您也可以根据需要配置其它的高可用方案，具体参考 [Mysql高可用架构介绍](../../../reference/other/mysql-ha-solutions)
{{% /alert %}}


## 1.Mysql双主互为主备+keepalived的部署配置方法

两台服务器(Node)，配置两个mysql实例互为主从:

|  Node  |  HostName  |        IP       |
|--------|------------|-----------------|
| ServerNode1  | server1.chime.com  | 192.168.231.11 |
| ServerNode2  | server2.chime.com  | 192.168.231.12 |

另外，每台服务器安装keepalived服务，通过设置VIP对外提供mysql服务。

规划VIP: 192.168.231.30

##### 1.配置server2同步server1的binlog

在server1上编辑/etc/my.conf, 添加如下配置

```
[mysqld]
server-id=1
log-bin=mysql-bin

#binlog only replicate database chime and portal
binlog-do-db=chime
binlog-do-db=portal
```

然后重启mysqld服务

```
sudo systemctl restart mysqld 
```

在Node1上执行SQL:

```
#mysql -u root -p 

CREATE USER 'chimesync'@'%' IDENTIFIED BY 'passw0rd';
GRANT REPLICATION SLAVE ON *.* TO 'chimesync'@'%';
FLUSH PRIVILEGES;
```

然后查询master的bin log状态: 

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

在server2上执行SQL:

```
change master to master_host='192.168.231.11',master_user='chimesync',master_password='passw0rd',master_log_file='mysql-bin.000001',master_log_pos=156;
```

**注意**: master_log_file和master_log_pos需要和Node1上 "show master status" 输出的binlog状态一致。

##### 2.配置server1同步server2的binlog

在Node2上编辑/etc/my.conf, 添加如下配置

```
[mysqld]
server-id=2
log-bin=mysql-bin

#binlog only replicate database chime and portal
binlog-do-db=chime
binlog-do-db=portal
```

然后重启mysqld服务

```
sudo systemctl restart mysqld 
```

在Node2上执行SQL:

```
#mysql -u root -p 

CREATE USER 'chimesync'@'%' IDENTIFIED BY 'passw0rd';
GRANT REPLICATION SLAVE ON *.* TO 'chimesync'@'%';
FLUSH PRIVILEGES;
```

然后查询master的bin log状态: 

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

在Node1上执行SQL:

```
change master to master_host='192.168.231.12',master_user='chimesync',master_password='passw0rd',master_log_file='mysql-bin.000001',master_log_pos=157;
```

**注意**: master_log_file和master_log_pos需要和Node2上 "show master status" 输出的binlog状态一致。

##### 3.验证server1和server2的mysql实例互为主从

在server1和server2分别在chime库创建test1/test2表

```
#on node1: 
USE chime;
CREATE TABLE TEST1(id INT AUTO_INCREMENT PRIMARY KEY); 

#on node2: 
USE chime;
SHOW TABLES;
CREATE TABLE TEST2(id INT AUTO_INCREMENT PRIMARY KEY); 

#on node1: 
SHOW TABLES;
```

验证test1/test2表在两个数据库实例均能看到。

##### 4.修改配置

如果要修改主从配置，可以在执行修改前停止slave replication，修改后再启动slave replication，例如: 

```
STOP SLAVE;
change master to xxx xxx ... 
START SLAVE;
```

##### 5.keepalived 配置

在server1编辑 /etc/keepalived/keepalived.conf, 添加如下内容

```
vrrp_script chk_mysql {
    script "nc -zv localhost 3306"
    interval 2                   # default: 1s
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


在server2编辑 /etc/keepalived/keepalived.conf, 添加如下内容

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

然后在server1和server2分别重启keepalived: 

```
sudo systemctl restart keepalived
```

最后可通过mysql客户端连接VIP地址进行验证:

```
mysql -h 192.168.231.30 -u root -p
```

## 2.PXC(Percona XtraDB Cluster)配置示例

规划三台服务器(Node): 

|  Node  |  Host  |        IP       |
|--------|--------|-----------------|
| ServerNode1  | server1.chime.com  | 192.168.231.11 |
| ServerNode2  | server2.chime.com  | 192.168.231.12 |
| ServerNode3  | server3.chime.com  | 192.168.231.13 |

{{% alert title="提示" color="primary" %}}
尽管Percona Cluster可以仅使用2个Node，但不推荐。
{{% /alert %}}

在三台server分别安装percona

```
sudo yum install https://repo.percona.com/yum/percona-release-latest.noarch.rpm
sudo percona-release setup pxc-80
sudo yum install percona-xtradb-cluster
```

安装结束后，对于每个Node, 编辑mysql配置文件/etc/my.cnf

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

对于server1, 添加如下配置:

```
wsrep_node_name=server1.chime.com
wsrep_node_address=192.168.231.11
pxc_strict_mode=ENFORCING
```

对于server2, 添加如下配置:

```
wsrep_node_name=server2.chime.com
wsrep_node_address=192.168.231.12
```

对于server3, 添加如下配置:

```
wsrep_node_name=server3.chime.com
wsrep_node_address=192.168.231.13
```

安装配置结束后，分别启动mysql服务

```
sudo systemctl enable mysql
sudo systemctl start mysql
```

查看节点在percona集群的状态:

```
show status like 'wsrep%';
```

