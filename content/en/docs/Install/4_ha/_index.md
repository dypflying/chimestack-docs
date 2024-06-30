---
title: 2.4 High Availability Setting
date: 2023-11-09
description: This chapter introduces how to deploy and configure the ChimeStack in a production environment, including how to achieve high-availability deployment of chime-server and chime-agent, as well as its dependent components like Mysql, Influxdb and OSS.
weight: 5
---

###  ChimeStack's HA Architecture Overview

In the production environment, The high-availability solution of ChimeStack is to clusterize its services in distributed nodes and introduce the "keepalived+LVS" component into the production for services' health check, automatic failover, and load balancing. So that when some components or services of ChimeStack are down, with the HA setting of keepalived+LVS, it will detect the failure and will failover to a healthy one in seconds, ChimeStack's overall supposed SLA is 99.5%.

Following is the summary of the HA solutions for ChimeStack's components

- chime-server: active-standby instances + keepalived(VIP) 
- chime-portal: active-active instances + keepalived(VIP) + LVS(load balancing)
- chime-agent: virtual machines' automatical migration in case of node's failure, implemented by ChimeStack.
- mysql: dual mysql instances of mutual master and slave + keepalived(VIP), or Percona cluster is an alternative solution  
- influxdb: active-active instances + chime-client dual writes + chime-server read from VIP endpoint+ keepalived(VIP)
- s3: minio's MNMD(Multiple-Node-Multiple-Drive) deployments

### HA requirements for deploying nodes

The simple formula for calculating the minimum nodes setting for a production environment: 
> m * server nodes + n * computing nodes (2<=m<=3, n>=1)

### High availability environment example

Plan for nodes and as well as their hostnames and IP addresses：

| Node | Hostname | Manage IP       | Description | 
|------|----------|----------|-------------|
| ServerNode1 | server1.chime.com | 192.168.231.11 | master node of management service | 
| ServerNode2 | server2.chime.com | 192.168.231.12 | slave node of management service | 
| Node1 | node1.chime.com | 192.168.231.101 | computing node1 | 
| Node2 | node2.chime.com | 192.168.231.102 | computing node2 | 
| ... | ... | ... | ... |

Plan for IP addresses with ports, and services
| IP:Port         | Component/Service |    Description     | 
|-----------------|-------------------|--------------------|
| 192.168.231.11:8801 | chime-server | Server1 API's real endpoint | 
| 192.168.231.12:8801 | chime-server | Server2 API's real endpoint | 
| 192.168.231.10:8801 | chime-server | Server API's VIP endpoint |
| 192.168.231.11:8802 | chime-server | Server1 grpc's real endpoint | 
| 192.168.231.12:8802 | chime-server | Server2 grpc's real endpoint | 
| 192.168.231.10:8802 | chime-server | Server grpc's VIP endpoint |
| 192.168.231.11:8033 | chime-portal | Server1 web UI's real endpoint | 
| 192.168.231.12:8033 | chime-portal | Server2 web UI's real endpoint | 
| 192.168.231.20:80   | chime-portal | web UI's VIP endpoint |
| 192.168.231.11:3306 | mysql        | Server1's mysql's real endpoint | 
| 192.168.231.12:3306 | mysql        | Server2's mysql's real endpoint | 
| 192.168.231.30:3306 | mysql        | mysql's VIP endpoint |
| 192.168.231.11:8086 | influxdb     | Server1's influxdb's real endpoint | 
| 192.168.231.12:8086 | influxdb     | Server2's influxdb's real endpoint | 
| 192.168.231.40:8086 | influxdb     | influxdb's VIP endpoint |
| 192.168.231.11:9000 | minio        | Server1's minio's real endpoint | 
| 192.168.231.12:9000 | minio        | Server2's minio's real endpoint | 
| 192.168.231.50:9000 | minio        | minio's VIP endpoint |

