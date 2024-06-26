---
title: 2.4 生产环境高可用配置
date: 2023-11-09
description: 本章介绍在生产环境下的ChimeStack的部署配置方案，包括chime-server、chime-agent的高可用部署及配置，以及mysql, influxdb和s3的高可用部署及配置。
weight: 5
---

### ChimeStack高可用架构简述

在生产环境下ChimeStack的高可用方案是通过对服务分布式集群化，并引入keepalived+lvs组件对实例进行健康检查、自动failover和负载均衡等，当部分服务崩溃或者服务器宕机情况下，不影响服务的可用性及数据的可靠性。

以下概括了ChimeStack各组件的高可用方案:

- chime-server: 一主一备(多备) + keepalived(VIP) 
- chime-portal: 双活(多活) + keepalived(VIP) + LVS(load balancing)
- chime-agent: 故障域同节点的故障域，节点出现故障时可以通过迁移、重建虚拟机实现虚拟机的高可用。
- mysql: 互为主从双活实例 + keepalived(VIP), 或者percona集群部署
- influxdb: 双活实例 + 客户端双写 + 服务端通过VIP读 + keepalived(VIP)
- s3: minio的MNMD(Multiple-Node-Multiple-Drive)部署模型

### 节点配置要求

生产环境最小配置计算公式: 2*管控节点 + n*计算节点 (n>=1)

### 高可用环境示例规格

示例节点、节点名称和节点IP规划：

| Node | Hostname | Manage IP       | Description | 
|------|----------|----------|-------------|
| ServerNode1 | server1.chime.com | 192.168.231.11 | 管控服务主节点 | 
| ServerNode2 | server2.chime.com | 192.168.231.12 | 管控服务从节点 | 
| Node1 | node1.chime.com | 192.168.231.101 | 计算节点1 | 
| Node2 | node2.chime.com | 192.168.231.102 | 计算节点2 | 
| ... | ... | ... | ... |

服务IP地址和端口，及服务规划
| IP:Port         | Component/Service |    Description     | 
|-----------------|-------------------|--------------------|
| 192.168.231.11:8801 | chime-server | Server1 API的真实endpoint | 
| 192.168.231.12:8801 | chime-server | Server2 API的真实endpoint | 
| 192.168.231.10:8801 | chime-server | Server API的VIP endpoint |
| 192.168.231.11:8802 | chime-server | Server1 grpc服务的真实endpoint | 
| 192.168.231.12:8802 | chime-server | Server2 grpc服务的真实endpoint | 
| 192.168.231.10:8802 | chime-server | Server grpc服务的VIP endpoint |
| 192.168.231.11:8033 | chime-portal | Server1 web UI服务的真实endpoint | 
| 192.168.231.12:8033 | chime-portal | Server2 web UI服务的真实endpoint | 
| 192.168.231.20:80   | chime-portal | web UI服务的VIP endpoint |
| 192.168.231.11:3306 | mysql        | Server1 mysql服务的真实endpoint | 
| 192.168.231.12:3306 | mysql        | Server2 mysql服务的真实endpoint | 
| 192.168.231.30:3306 | mysql        | mysql服务的VIP endpoint |
| 192.168.231.11:8086 | influxdb     | Server1 influxdb服务的真实endpoint | 
| 192.168.231.12:8086 | influxdb     | Server2 influxdb服务的真实endpoint | 
| 192.168.231.40:8086 | influxdb     | influxdb服务的VIP endpoint |
| 192.168.231.11:9000 | minio        | Server1 minio服务的真实endpoint | 
| 192.168.231.12:9000 | minio        | Server2 minio服务的真实endpoint | 
| 192.168.231.50:9000 | minio        | minio服务的VIP endpoint |

