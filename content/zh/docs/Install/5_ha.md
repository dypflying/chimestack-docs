---
title: 2.5 高可用配置
date: 2023-11-09
description: 本章介绍如何配置让ChimeStack高可用，包括chime-server高可用、chime-agent高可用以及依赖的mysql, influxdb和s3的高可用部署。
weight: 6
---

## chime-server的高可用配置

chime-server的高可用的实现主要依赖keepalive, kepalived 提供了一个负载均衡和一个高可用性的框架：

- 负载均衡框架依赖于非常著名的Linux虚拟服务器（IPVS）内核模块，该模块提供第4层负载均衡。
- 高可用框架实现了虚拟冗余路由协议——VRRP，VRRP是路由器故障转移的基本模块。 

这两个框架都均可以独立使用或者一起使用，以提供弹性基础设施。

根据keepalive的框架功能，chime-server的高可用可以实现active-standby的模式（主备），或者active-active的模式(双活或多活)，下面分别介绍通过keepalive实现两种模式的配置

### 安装 keepalived 

运行下面命令: 

```
sudo yum install -y keepalived
```

编辑keepalived的配置文件:

```
sudo vim /etc/keepalived/keepalived.conf
```

启动并设置开机启动:

```
sudo systemctl enable keepalived
sudo systenctl start keepalived
```

### chime-server主备(active-standby)配置

在规划的chime-server主节点上, 安装keepalived并编辑/etc/keepalived/keepalived.conf, 添加或修改以下部分: 

```
vrrp_script chk_server {
    script "/usr/bin/pgrep chime-server" # or "nc -zv localhost 8801" 检查进程或者端口的可达性
    interval 2                           # default: 1s  检查间隔
}


vrrp_instance VI_1 {
    state MASTER                         # 设置当前为默认主节点
    interface ens160                     # 管理网网口的名称
    virtual_router_id 51                 # 重要，必须和其它从节点的router_id一致
    priority 255                         # 权重，不小于从节点的数值
    advert_int 1
    authentication {
        auth_type PASS                   # 认证方式
        auth_pass 1111                   # 认证密码
    }
    virtual_ipaddress {
        192.168.231.161                  # VIP地址
    }
    track_script {
        chk_server                       # 健康检查设置
    }
}
```


在规划的chime-server从节点上, 安装keepalived并编辑/etc/keepalived/keepalived.conf, 添加或修改以下部分: 

```
vrrp_script chk_server {
    script "/usr/bin/pgrep chime-server" # or "nc -zv localhost 8801" 检查进程或者端口的可达性
    interval 2                           # default: 1s  检查间隔
}


vrrp_instance VI_1 {
    state BACKUP                         # 设置当前为默认从节点
    interface ens160                     # 管理网网口的名称
    virtual_router_id 51                 # 重要，必须和其它节点的router_id一致
    priority 254                         # 权重，不大于主节点的数值
    advert_int 1
    authentication {
        auth_type PASS                   # 认证方式
        auth_pass 1111                   # 认证密码
    }
    virtual_ipaddress {
        192.168.231.161                  # VIP地址
    }
    track_script {
        chk_server                       # 健康检查设置
    }
}
```

配置完成后均需重启keepalived

```
sudo systemctl restart keepalived 
```

配置后即可通过VIP访问chime-server，例如通过"http://192.168.231.161:8033/"访问Web UI，或通过"192.168.231.161:8801"访问API

当chime-server进程不可达或者主服务器down机时，VIP会从主节点漂移到从节点；当主节点服务恢复时，VIP会从从节点漂移回主节点。

### chime-server双活(active-active)配置

{{% alert title="提示" color="warning" %}}
对于分布式系统在多活模式下，可能出现事务的一致性问题，chime-server通过对事物添加记录锁，基本保障了在多活模式下事务的一致性，但目前Dev版本测试尚未充分，所以当前不建议采用多活的配置，仍然推荐主备的配置方式实现chime-server的高可用。
{{% /alert %}}

在多活(双活)模式下，各chime-server会根据选择的load balancing算法接受请求，但只有一个服务器可以接收入口请求，也就是说，只有其中一个服务器作为路由接收所有的外部请求，然后分发到所有可达的chime-server进程响应请求。这种方式是keepalived+lvs的经典场景，即keepalived提供虚拟路由(VIP)、健康检测和故障failover功能，lvs负责负载均衡。

其中lvs可以选择的三种模式是: NAT,DR和TUN。

负载均衡算法有：rr(Round Robin), wrr(Weighted Round Robin), lc(Least Connection), wlc(Weighted Least Connection), sh(Source Hashing), dh(Destination Hashing), lblc(Locality-Based Least Connection)

在规划的chime-server主节点上, 安装keepalived并编辑/etc/keepalived/keepalived.conf, 添加或修改以下部分: 

```
vrrp_instance VI_1 {
    state MASTER                   # 设置当前为默认主节点
    interface ens160               # 管理网网口的名称
    virtual_router_id 51           # 重要，必须和其它节点的router_id一致
    priority 255                   # 权重，不小于从节点的数值
    advert_int 1
    authentication {
        auth_type PASS             # 认证方式
        auth_pass 1111             # 认证密码
    }
    virtual_ipaddress {
        192.168.231.161            # VIP地址
    }
}

virtual_server 192.168.231.161 80 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.128 8033 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.158 8033 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}

virtual_server 192.168.231.161 8801 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.128 8801 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.158 8801 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}
```


在规划的chime-server从节点上, 安装keepalived并编辑/etc/keepalived/keepalived.conf, 添加或修改以下部分: 

```
vrrp_instance VI_1 {
    state BACKUP                   # 设置当前为默认从节点
    interface ens160               # 管理网网口的名称
    virtual_router_id 51           # 重要，必须和其它节点的router_id一致
    priority 255                   # 权重，不大于主节点的数值
    advert_int 1
    authentication {
        auth_type PASS             # 认证方式
        auth_pass 1111             # 认证密码
    }
    virtual_ipaddress {
        192.168.231.161            # VIP地址
    }
}

virtual_server 192.168.231.161 80 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.128 8033 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.158 8033 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}


virtual_server 192.168.231.161 8801 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.128 8801 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.158 8801 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}
```


配置完成后均需重启keepalived

```
sudo systemctl restart keepalived 
```

配置后即可通过VIP访问chime-server，例如通过"http://192.168.231.161/"访问Web UI，或通过"192.168.231.161:8801"访问API

按示例部署的两个chime-server进程只要有一个服务可达，即可正常提供服务。两台keepalived服务器只要有一台可达，keepalived+lvs服务即可正常运行。


## chime-agent 高可用介绍

chime-agent进程作为运行在计算节点程序，它接收chime-server下发的指令并对虚拟机的全生命周期进行管控，所以chime-agent的高可用即计算服务的高可用，是ChimeStack高可用框架中另外重要的一部分。ChimeStack为了保证虚拟机事务的一致性，即对于任一运行的客户虚拟机实例，同一时刻，保证有且仅有一个运行的qemu-kvm进程，并可对其生命周期进行管理控制，简单地说，客户端(计算节点)的高可用可以分成三个要求：
- 虚拟机进程高可用(SLA 99.9%)
- 虚拟机进程的唯一性
- 虚拟机可管控
  
### 虚拟机进程高可用框架

ChimeStack框架的设计方案主要是中央管控机制，即管控服务进程(chime-server)管理虚拟机的全生命周期，每个虚拟机的状态都会保存在chime-server的数据库中，chime-agent接收chime-server对虚拟机的的管控指令、对chime-server上报心跳、拉取虚拟机信息，下图是chime-agent高可用的示意图： 

![TO-DO](chimeagent-ha.png)

- chime-agent在启动时，会主动向chime-server请求当前计算节点所有未删除的虚拟机的状态以及当前计算节点的状态，并且保存在chime-agent程序的内存中，一旦虚拟机的状态被客户改变，如停机、删除、启动等，chime-agent也会同步更新这个内存数据库。
- chime-agent在运行时，每隔30s就会检查自己运行节点的虚拟机实例(qemu-kvm进程)的运行状态是否和当前内存数据库中的状态保持一致，比如发现某qemu-kvm进程异常退出，chime-agent会自动拉起该qemu-kvm进程。 
- chime-agent在运行时，每隔10s会上报自己的心跳信息，如果chime-server在三个心跳周期没有收到某个chime-agent的心跳信息，会反ping一下该chime-agent，如果确定chime-agent不可达，则会标记为该节点为unreachable状态，在此状态下，不会再调度新虚拟机到这个节点上，且当前在此节点的虚拟机将不再接收管控命令，同时发出报警信息。如果chime-agent上报心跳成功，则会重新把该节点的状态标记为"运行"，管控指令也恢复正常。
- chime-agent进程的生命周期由linux systemctl负责管理，只要系统启动chime-agent进程就会被拉起，如果chime-agent进程异常退出后，也会被自动拉起。

#### 异常场景下的解决方案

##### 场景1 计算节点故障掉电

计算节点故障包括电源、CPU、内存、硬盘等硬件的严重故障导致的掉电。

根据chime-agent的实现，如果计算节点断电，chime-server不会再继续接收chime-agent发出的心跳信息，在3个心跳周期没有客户端的信息后，会把该计算节点标记为unreachable的状态。计算节点重新启动后，chime-agent首先会拉取本节点的管理状态和该节点虚拟机的状态：
- 如果节点的管理状态是"unreadable"或者"run"，则会正常上报心跳，然后恢复到正常状态，同时根据虚拟机的状态检查并更新该节点虚拟机的实例。
- 如果节点的状态是"Down"，即管理员已经在管理端把该节点踢出集群，则chime-agent会将该节点的虚拟机停止，并且不再接收管理端关于虚拟机的所有命令。

针对服务器掉电的故障，客户的虚拟机可以被自动拉起，但虚拟机重启是可以被客户感知到的。

#### 场景2 网络故障

网络故障包括网络设备如交换机、网线，或者服务器网卡，以及软件原因造成的网络不可达。

- 管理网不可用，业务网可用: chime-server接收不到chime-agent的心跳信息，只会将节点标记为"unreachable"，只能由管理员/运维人员人工确认网络/硬件故障，然后实施操作， 可以通过运维命令"chime-agent migrate --interface <interface name> --uuid <vm uuid> --dest <dest ip>"，其中interface name为业务网网口，dest为业务网目标地址，通过业务网手动迁移虚拟机当前节点的虚拟机到其它节点，最后标记该节点为"Down"状态。对于这种情况，客户是对迁移操作无感知的，且虚拟机正常运行。
- 管理网可用、业务网不可用: chime-agent会每30s检测业务网的状态，如果业务网出现问题，chime-agent在向chime-server上报心跳时，会标记计算节点状态为"error"。可以通过运维命令"chime-agent migrate --interface <interface name> --uuid <vm uuid> --dest <dest ip>", 其中interface name为管理网网口，dest为管理网目标地址，通过业务网手动迁移虚拟机当前节点的虚拟机到其它节点，最后标记该节点为"Down"状态。对于这种情况，因为业务网络中断，客户对虚拟机的访问是中断的，单虚拟机正常运行。 
- 管理网、业务网均不可用: 此时，管理节点侧的状态应该是"unreachable",计算节点侧的状态为"error"，由于管理网和业务网都不可达，所以无法完成迁移动作。运维人员可以根据运维手册，或等待修复网络；或人工清除所有虚拟机实例，如运行"chime-agent drain"命令，然后在其它节点重新建立新的虚拟机实例。对于这种情况，客户对虚拟机的访问是中断的，虚拟机需要重新启动。
  
#### 场景3 chime-agent进程异常

chime-agent进程出现严重异常时，chime-agent进程会异常退出。chime-agent进程的生命周期由systemctl命令管控，并且设置了进城自动拉起，所以chime-agent掉线时，会被系统进程自动地拉起，即可以看作chime-agent进程和计算节点生命周期一致。

#### 场景4 其它非严重硬件故障

有时候，硬件的故障并不会导致服务器关机，或者网络不可达这样的可以直接察觉的严重故障。有些硬件故障比如磁盘故障导致的I/O异常、网络设备故障导致的丢包等，程序并不会直接修改计算节点的状态。针对这种故障，ChimeStack提供了完善的监控机制来发现各种硬件设备的异常数据，比如网口丢包等，运维人员根据监控报警信息，人工确认后再手动执行运维操作，比如建议，标记"Down"等。 

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

