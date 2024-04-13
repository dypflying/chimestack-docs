---
title: 2.4 高可用配置
date: 2023-11-09
description: 本章介绍如何配置让ChimeStack高可用，包括chime-server高可用、chime-agent高可用以及依赖的mysql, influxdb和s3的高可用部署。
weight: 6
---

{{% alert title="提示" color="default" %}}

{{% /alert %}}

## 依赖组件的高可用配置介绍

### mysql高可用

#### mysql高可用架构介绍

当前软件系统中，数据库的高可用尤为关键，毕竟数据库是承载软件系统数据存储和检索的基础组件，mysql作为ChimeStack的当前的数据存储组件，其可用性直接关系到chime-server以及整个ChimeStack的可用性和可靠性。

下面介绍几种常用的mysql高可用架构:

1. 双主+keepalived模式: 两台MySQL数据库互为主从, 同过keepalived设定的VIP对外提供服务，keepalived负责mysql实例的健康检测和failover。
   
    ![keepalived+dualmaster](/images/mysql-keepalived+dual-master.png)
    
    ChimeStack默认的mysql高可用方案，后面详细介绍其配置方法。

2. MMM(Multi-Master Replication Manager): 多主复制机制，基于MySQL的复制机制，通过在多个MySQL实例之间进行主从复制，实现了数据的同步和备份。
   
    ![Google-MMM](/images/mysql-mmm.png)
   
   其中Google开源项目MySQL-MMM提供了MySQL主主复制配置的监控、故障转移和管理的一套可伸缩的脚本套件。[下载地址](https://mysql-mmm.org/)

3. MHA(Master High Availability): MHA由MHA Node(数据节点)、MHA Manager(管理节点)两部分组成。MHA Node运行在每台MySQL服务器上。MHA Manager可以单独部署在一台独立的机器上，管理多个Master-Slave集群。在主数据库发生故障时，能够快速自动地将备库（Slave）提升为新的主库，以保证系统的连续性和可用性。
   
    ![MHA](/images/mysql-mha.png)

    部署配置参考 [MHA作者github](https://github.com/yoshinorim/mha4mysql-manager/wiki/Installation)

4. MGR(MySQL Group Replication): MySQL官方提供的一种高可用性架构，用于实现MySQL数据库的主从复制和自动故障切换。MGR基于MySQL的InnoDB存储引擎和Group Replication插件，通过使用多主复制的方式来提供高可用性和数据一致性。
   
     ![MGR](/images/mysql-mgr.png)

    部署配置参考 [Mysql官方Blog](https://dev.mysql.com/blog-archive/mysql-group-replication-a-quick-start-guide/)。
   
5. Mysql NDB Cluster: MySQL官方提供的一种分布式数据库解决方案，旨在提供高可用性、可扩展性和实时性能。它基于NDB(Network DataBase)存储引擎，使用多台服务器组成一个集群，提供数据的分片和复制，以实现高可用性和负载均衡。
   
   ![NDB Cluster](/images/mysql-ndb-cluster.png)

   部署配置可参考 [Mysql官方文档](https://dev.mysql.com/doc/refman/8.3/en/mysql-cluster-installation.html)

6. Galera Cluster: 基于同步多主复制的MySQL集群解决方案。使用Galera Replication插件，通过在多个MySQL节点之间同步数据来实现高可用性和负载均衡。
   
    ![Galera Cluster](/images/mysql-galera-cluster.png)

    部署配置可参考 [Galera官方文档](https://galeracluster.com/)

7. PXC(Percona XtraDB Cluster): 基于Galera Cluster的高可用性和高性能的MySQL集群解决方案。由Percona开发的，建立在Galera Replication插件之上，提供了多主复制和数据同步的功能。

    ![Percona Cluster](/images/mysql-percona-cluster.png)

    安装配置方法可以参考 [Percona官方文档](https://docs.percona.com/percona-xtradb-cluster/8.0/quickstart-overview.html)

除了以上几种常见的mysql高可用架构，还有以下几种可以配合mysql高可用架构一起使用数据可靠性方案: 

1. RAID10(Redundant Array of Independent Disks 10)存储方案: 结合了RAID1(镜像)和RAID0(条带)的特性。RAID10通过将多个磁盘组合在一起，提供了数据冗余和性能增强的优势。
2. SAN(Storage Area Network)高速网络存储: 它将存储设备(如磁盘阵列、磁带库等)与服务器连接起来，提供高性能、高可用性和可扩展性的存储解决方案。
3. Mysql+DRBD: 通过将MySQL数据库的数据目录配置为DRBD设备，可以实现数据的实时复制和故障转移。

#### Mysql双主+keepalived的部署配置方法

规划两台服务器(Node)，配置两个mysql实例互为主从:

|  Node  |  Host  |        IP       |
|--------|--------|-----------------|
| Node1  | host1  | 192.168.231.151 |
| Node2  | host2  | 192.168.231.152 |

另外，每台服务器安装keepalived服务，通过设置VIP对外提供mysql服务。

规划VIP: 192.168.231.162

###### 1.配置Node2同步Node1的binlog

在Node1上编辑/etc/my.conf, 添加如下配置

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

在Node2上执行SQL:

```
change master to master_host='192.168.231.151',master_user='chimesync',master_password='passw0rd',master_log_file='mysql-bin.000001',master_log_pos=156;
```

**注意**: master_log_file和master_log_pos需要和Node1上 "show master status" 输出的binlog状态一致。

###### 2.配置Node1同步Node2的binlog

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
change master to master_host='192.168.231.152',master_user='chimesync',master_password='passw0rd',master_log_file='mysql-bin.000001',master_log_pos=157;
```

**注意**: master_log_file和master_log_pos需要和Node2上 "show master status" 输出的binlog状态一致。

###### 3.验证node1和node2的mysql实例互为主从

在node1和node2分别在chime库创建test1/test2表

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

###### 4.修改配置

如果要修改主从配置，可以在执行修改前停止slave replication，修改后再启动slave replication，例如: 

```
STOP SLAVE;
change master to xxx xxx ... 
START SLAVE;
```

###### 5.keepalived 配置

在Node1编辑 /etc/keepalived/keepalived.conf, 添加如下内容

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
        192.168.231.162
    }

    track_script {
        chk_mysql
    }
}
```


在Node2编辑 /etc/keepalived/keepalived.conf, 添加如下内容

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
        192.168.231.162
    }

    track_script {
        chk_mysql
    }
}
```

然后在Node1和Node2分别重启keepalived: 

```
sudo systemctl restart keepalived
```

最后可通过mysql客户端连接VIP地址进行验证:

```
mysql -h 192.168.231.162 -u root -p
```

#### PXC(Percona XtraDB Cluster)配置示例

规划三台服务器(Node): 

|  Node  |  Host  |        IP       |
|--------|--------|-----------------|
| Node1  | host1  | 192.168.231.171 |
| Node2  | host2  | 192.168.231.172 |
| Node3  | host3  | 192.168.231.173 |

{{% alert title="提示" color="primary" %}}
尽管Percona Cluster可以仅使用2个Node，但不推荐。
{{% /alert %}}

在三台Node分别安装percona

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
wsrep_cluster_address=gcomm://192.168.231.171,192.168.231.172,192.168.231.173

[mysqld]
wsrep_provider_options=”socket.ssl_key=server-key.pem;socket.ssl_cert=server-cert.pem;socket.ssl_ca=ca.pem”

[sst]
encrypt=4
ssl-key=server-key.pem
ssl-ca=ca.pem
ssl-cert=server-cert.pem
```

对于Node1, 添加如下配置:

```
wsrep_node_name=host1
wsrep_node_address=192.168.231.171
pxc_strict_mode=ENFORCING
```

对于Node2, 添加如下配置:

```
wsrep_node_name=host2
wsrep_node_address=192.168.231.172
```

对于Node3, 添加如下配置:

```
wsrep_node_name=host3
wsrep_node_address=192.168.231.173
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

### influxdb高可用

ChimeStack关于influxdb高可用的解决方案比较简单，通过部署双活influxdb实例+keepalived来实现高可用的目的。即部署两个influxdb实例在两台不同的服务器上，两台服务器的influxdb除了访问地址外，其它访问配置(token, org, bucket)完全相同。对influxdb的写入全部都是双写，即数据是同时写入两个influxdb中，此外，通过keepalived配置虚拟VIP并配置主从influxdb实例，当出现主influxdb故障时，VIP会切换到从服务器上。对influxdb数据的检索都是通过这个VIP访问的，这样保证了重要的报警指标数据检索的高可用性。

架构示意图如下所示: 

![Influxdb HA](/images/influxdb_ha.png)

其中通过物理网口的IP地址访问的influxdb的endpoint叫做real endpoint, 通过VIP访问influxdb的endpoint叫做vip endpoint，客户端对influxdb的数据写入是直接写入全部的real endpoint，而对influxdb数据的读取是通过vip endpoint。

{{% alert title="提示" color="primary" %}}
这种部署的一个弊端是，由于网络、服务器可能出现的异常，两个influxdb的数据可能不完全一致，当发生VIP切换时，可能出现信息不一致问题。
{{% /alert %}}

###### 配置chime-server

规划两台服务器(Node)运行influxdb: 

|  Node  |     Host      |        IP       |
|--------|---------------|-----------------|
| Node1  | influx-host1  | 192.168.231.141 |
| Node2  | influx-host2  | 192.168.231.142 |

VIP: 192.168.231.143

通过chimeadm配置chime-server: 

```
chimeadm initserver influxdb --vip-endpoint http://192.168.231.143:8086 \
  --real-endpoints http://192.168.231.141:8086,http://192.168.231.142:8086
  --token x5iGbxLx-2QKN64I3wooyZsHPtmGB4OvBspdSLuOcEBeN-_-rrnC_1GbtSrJrUD0-qSiXsYrKC0T4VF4m97ecw== \
  --org chime \
  --bucket chime \
```

###### 配置keepalived


在Node1编辑 /etc/keepalived/keepalived.conf, 添加如下内容

```
vrrp_script chk_influxdb {
    script "nc -zv localhost 8086"
    interval 2                   # default: 1s
}

vrrp_instance VI_3 {
    state MASTER
    interface ens160
    virtual_router_id 53
    priority 255
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        192.168.231.143
    }

    track_script {
        chk_influxdb
    }
}
```


在Node2编辑 /etc/keepalived/keepalived.conf, 添加如下内容

```
vrrp_script chk_influxdb {
    script "nc -zv localhost 8086"
    interval 2                   # default: 1s
}

vrrp_instance VI_3 {
    state BACKUP
    interface ens160
    virtual_router_id 53
    priority 254
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        192.168.231.143
    }

    track_script {
        chk_influxdb
    }
}
```

然后在Node1和Node2分别重启keepalived: 

```
sudo systemctl restart keepalived
```

###### 其它高可用方案

客户也可以采取开源的influx-cluster方案，具体参考 [influxdb-cluster部署配置](https://github.com/chengshiwen/influxdb-cluster)，或者influxdb官方付费版的Influxdb Enterprise方案, 具体参考 [官方Influx Enterprise部署配置](https://docs.influxdata.com/enterprise_influxdb/v1/)，这两种方案的可用性/可靠性均优于influxdb双写+keepalived的方案，但部署成本和经济成本均比较高，客户可以综合考虑比较收益和成本进行选择。


### s3高可用

s3软件几乎全部提供高可用的架构方案，ChimeStack推荐minio的多节点多硬盘方案实现高可用

###### 环境准备

下面介绍双节点，每个节点三个硬盘的方案

|  Node  |     HostName      |        IP       |                     Disks               |
|--------|-------------------|-----------------|-----------------------------------------|
| Node1  | node1.chime.com   | 192.168.231.171 | /dev/nvme0n2,/dev/nvme0n3,/dev/nvme0n4  |
| Node2  | node2.chime.com   | 192.168.231.172 | /dev/nvme0n2,/dev/nvme0n3,/dev/nvme0n4  |
| VIP    | minio.chime.com   | 192.168.231.170 |  |


**说明**: 方案用两台服务器提供minio的s3服务，每台机器规划三块硬盘为minio提供存储

在Node1和Node2分别格式化磁盘并挂载目录:

```
mkfs.xfs /dev/nvme0n2 && mkfs.xfs /dev/nvme0n3 && mkfs.xfs /dev/nvme0n4 
mkdir -p /minio/disk1 && mkdir -p /minio/disk2 && mkdir -p /minio/disk3
mount /dev/nvme0n2 /minio/disk1
mount /dev/nvme0n3 /minio/disk2
mount /dev/nvme0n4 /minio/disk3
```

在Node1和Node2分别编辑/etc/hosts: 

```
192.168.231.171 node1.chime.com
192.168.231.172 node2.chime.com
192.168.231.170 minio.chime.com
```

在Node1和Node2分别添加minio-user用户和用户组，并且改变存储目录所有者:

```
groupadd -r minio-user
useradd -M -r -g minio-user minio-user
chown -R minio-user:minio-user /minio/disk1 /minio/disk2 /minio/disk3 
```

###### 安装minio 

在Node和Node2分别安装minio

```
wget https://dl.min.io/server/minio/release/linux-amd64/archive/minio-20240406052602.0.0-1.x86_64.rpm -O minio.rpm
sudo dnf install minio.rpm
```

###### 配置minio

在Node和Node2分别新建(编辑) /etc/default/minio 文件，这个文件为minio进程运行时参数提供环境变量文件: 

```
# The MINIO_VOLUMES setting covers 2 MinIO hosts with 3 drives each at the specified hostname and drive locations.
MINIO_VOLUMES="http://node{1...2}.chime.com:9000/minio/disk{1...3}"

# console access port
MINIO_OPTS="--console-address :9001"

# the root username
MINIO_ROOT_USER=minioadmin

# the root password
MINIO_ROOT_PASSWORD=minioadmin

# the url(VIP) for the entrypoint of load balancer
MINIO_SERVER_URL="http://minio.chime.com:9000"
```

###### 启动minio集群

在node1和node2分别启动minio，并查看minio启动状态
```
sudo systemctl start minio 
systemctl status minio
```

###### 配置keepalived+lvs

在Node1编辑/etc/keepalived/keepalived.conf，添加如下配置:

```
vrrp_instance VI_4 {
    state MASTER                   # 设置当前为默认主节点
    interface ens160               # 管理网网口的名称
    virtual_router_id 54           # 重要，必须和其它节点的router_id一致
    priority 255                   # 权重，不小于从节点的数值
    advert_int 1
    authentication {
        auth_type PASS             # 认证方式
        auth_pass 1111             # 认证密码
    }
    virtual_ipaddress {
        192.168.231.170            # VIP地址
    }
}

virtual_server 192.168.231.170 9000 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.171 9000 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.172 9000 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}
```


在Node2编辑/etc/keepalived/keepalived.conf，添加如下配置:

```
vrrp_instance VI_4 {
    state BACKUP                   # 设置当前为默认主节点
    interface ens160               # 管理网网口的名称
    virtual_router_id 54           # 重要，必须和其它节点的router_id一致
    priority 254                   # 权重，不小于从节点的数值
    advert_int 1
    authentication {
        auth_type PASS             # 认证方式
        auth_pass 1111             # 认证密码
    }
    virtual_ipaddress {
        192.168.231.170            # VIP地址
    }
}

virtual_server 192.168.231.170 9000 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.171 9000 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.172 9000 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}
```

然后重启keepalived完成为minio服务添加的负载均衡服务: 

```
sudo systemctl restart keepalived
```

最后可以通过 http://minio.chime.com:9001/ 访问Web UI，或者通过 minio.chime.com:9000访问minio服务

