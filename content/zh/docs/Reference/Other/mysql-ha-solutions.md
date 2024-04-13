---
title: Mysql高可用架构介绍
weight: 3
---

在当代软件系统中，数据库的高可用尤为关键，毕竟数据库是承载软件系统数据存储和检索的基础组件，mysql作为ChimeStack的当前的数据存储组件，其可用性直接关系到chime-server以及整个ChimeStack的可用性和可靠性。

下面介绍几种常用的mysql高可用架构:

### 1.双主+keepalived模式
     
    两台MySQL数据库互为主从, 同过keepalived设定的VIP对外提供服务，keepalived负责mysql实例的健康检测和failover。ChimeStack默认的mysql高可用方案。
   
    ![keepalived+dualmaster](/images/mysql-keepalived+dual-master.png)
    
### 2.MMM(Multi-Master Replication Manager)

    多主复制机制，基于MySQL的复制机制，通过在多个MySQL实例之间进行主从复制，实现了数据的同步和备份。
   
    ![Google-MMM](/images/mysql-mmm.png)
   
    其中Google开源项目MySQL-MMM提供了MySQL主主复制配置的监控、故障转移和管理的一套可伸缩的脚本套件。[下载地址](https://mysql-mmm.org/)

### 3.MHA(Master High Availability) 
    
    MHA由MHA Node(数据节点)、MHA Manager(管理节点)两部分组成。MHA Node运行在每台MySQL服务器上。MHA Manager可以单独部署在一台独立的机器上，管理多个Master-Slave集群。在主数据库发生故障时，能够快速自动地将备库（Slave）提升为新的主库，以保证系统的连续性和可用性。
   
    ![MHA](/images/mysql-mha.png)

    部署配置参考 [MHA作者github](https://github.com/yoshinorim/mha4mysql-manager/wiki/Installation)

### 4.MGR(MySQL Group Replication)
    
    MySQL官方提供的一种高可用性架构，用于实现MySQL数据库的主从复制和自动故障切换。MGR基于MySQL的InnoDB存储引擎和Group Replication插件，通过使用多主复制的方式来提供高可用性和数据一致性。
   
    ![MGR](/images/mysql-mgr.png)

    部署配置参考 [Mysql官方Blog](https://dev.mysql.com/blog-archive/mysql-group-replication-a-quick-start-guide/)。
   
### 5.Mysql NDB Cluster
    
    MySQL官方提供的一种分布式数据库解决方案，旨在提供高可用性、可扩展性和实时性能。它基于NDB(Network DataBase)存储引擎，使用多台服务器组成一个集群，提供数据的分片和复制，以实现高可用性和负载均衡。
   
    ![NDB Cluster](/images/mysql-ndb-cluster.png)

    部署配置可参考 [Mysql官方文档](https://dev.mysql.com/doc/refman/8.3/en/mysql-cluster-installation.html)

### 6.Galera Cluster
     
    基于同步多主复制的MySQL集群解决方案。使用Galera Replication插件，通过在多个MySQL节点之间同步数据来实现高可用性和负载均衡。
   
    ![Galera Cluster](/images/mysql-galera-cluster.png)

    部署配置可参考 [Galera官方文档](https://galeracluster.com/)

### 7.PXC(Percona XtraDB Cluster)

    基于Galera Cluster的高可用性和高性能的MySQL集群解决方案。由Percona开发的，建立在Galera Replication插件之上，提供了多主复制和数据同步的功能。

    ![Percona Cluster](/images/mysql-percona-cluster.png)

    安装配置方法可以参考 [Percona官方文档](https://docs.percona.com/percona-xtradb-cluster/8.0/quickstart-overview.html)

### 数据可靠性增强方案

    除了以上几种常见的mysql高可用架构，还有以下几种可以配合mysql高可用架构一起使用数据可靠性方案: 

   - RAID10(Redundant Array of Independent Disks 10)存储方案: 结合了RAID1(镜像)和RAID0(条带)的特性。RAID10通过将多个磁盘组合在一起，提供了数据冗余和性能增强的优势。
   - SAN(Storage Area Network)高速网络存储: 它将存储设备(如磁盘阵列、磁带库等)与服务器连接起来，提供高性能、高可用性和可扩展性的存储解决方案。
   - Mysql+DRBD: 通过将MySQL数据库的数据目录配置为DRBD设备，可以实现数据的实时复制和故障转移。
