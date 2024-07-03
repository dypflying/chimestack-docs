---
title: Introduction to Mysql's Architecture
weight: 3
---

Modern software systems need to have their information stored in high-availability databases. As the data storage component of ChimeStack, the availability of MySQL is a key aspect of the reliability of the chime-server and even the entire ChimeStack.

Following are some popular MySQL's high-availability architectures:

### 1. Dual master+keepalived model
     
Deploy two MySQL databases that are mutually master-slave, and provide external services through a VIP address provisioned by keepalived. Keepalived takes charge of the MySQL instance's health detection and automatic failover. It is adopted as ChimeStack's default MySQL's HA solution.
   
![keepalived+dualmaster](/images/mysql+keepalived.png)
    
### 2.MMM(Multi-Master Replication Manager)

The multi-master replication mechanism is based on the MySQL replication mechanism. It achieves data synchronization and backup by performing master-slave replication between multiple MySQL instances.
   
![Google-MMM](/images/mysql+mmm.png)
   
The Google's open source project "MySQL-MMM" provides a scalable script suite for monitoring, failover and management of MySQL master-master replication configuration. [Download Link](https://mysql-mmm.org/)

### 3.MHA(Master High Availability) 
    
MHA consists of two parts: MHA Node (data node) and MHA Manager (management node). MHA Node runs on each MySQL server. MHA Manager can be deployed on a separate machine to manage multiple Master-Slave clusters. When the master database fails, the slave instance can be automatically promoted to the master instance quickly to ensure the entire system's continuity and availability.
   
![MHA](/images/mysql+mha.png)

Deployment and configuration refer to [MHA github](https://github.com/yoshinorim/mha4mysql-manager/wiki/Installation)

### 4.MGR(MySQL Group Replication)

A high-availability solution provided by the official MySQL team, it implements master-slave replication and automatic failover. MGR is based on MySQL's InnoDB storage engine and its group replication plug-in, which provides high availability and data consistency by using multi-master replication.
   
![MGR-Deploy](/images/mysql+mgr+deploy.png)

Mysql Group Replication's data consistency protocol: 

![MGR-Transaction](/images/mysql+mgr+thoery.png)


Deployment and configuration refer to [Mysql Offical Blog](https://dev.mysql.com/blog-archive/mysql-group-replication-a-quick-start-guide/)。
   
### 5.Mysql NDB Cluster

A distributed database solution officially provided by MySQL, designed to provide high availability, scalability, and real-time performance. It is based on the NDB (Network DataBase) storage engine, which uses multiple servers to form a cluster, provides data sharding and replication, it achieves high availability and load balancing.
   
![NDB Cluster](/images/mysql+ndb-cluster.png)

Deployment and configuration refer to  [Mysql Offical Documentation](https://dev.mysql.com/doc/refman/8.3/en/mysql-cluster-installation.html)

### 6.Galera Cluster

It is a MySQL cluster solution based on synchronous multi-master replication, it uses the Galera Replication plug-in to achieve high availability and load balancing by synchronizing data between multiple MySQL nodes.
   
![Galera Cluster](/images/mysql+galera.png)

Deployment and configuration refer to [Galera Official Documentation](https://galeracluster.com/)

### 7.PXC(Percona XtraDB Cluster)

A high-availability and high-performance MySQL cluster solution based on Galera Cluster. Developed by Percona, it is built on the Galera Replication plug-in and provides multi-master replication and data synchronization capabilities.

![Percona Cluster](/images/mysql+percona-cluster.png)

Deployment and configuration refer to [Percona Official Documentation](https://docs.percona.com/percona-xtradb-cluster/8.0/quickstart-overview.html)

### Solution for enhancing data reliability

In addition to the above several MySQL's high availability solutions, there are also some data reliability enhancement solutions that can be used together with MySQL's high availability solutions:

- RAID10(Redundant Array of Independent Disks 10) storage solution: It combines the features of RAID1 (mirroring) and RAID0 (striping), RAID10 provides the advantages of data redundancy and performance enhancement by combining multiple disks.
- SAN(Storage Area Network) storage solution: It connects storage devices (such as disk arrays, tape libraries, etc.) to servers to provide high-performance, high-availability and scalable storage solutions.
- Mysql+DRBD: By building its data persistent directory of the MySQL database as a DRBD device, it can achieve real-time replication and automatic failover.
