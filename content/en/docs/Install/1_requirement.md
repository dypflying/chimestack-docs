---
title: 2.1 Prerequisites
date: 2023-11-09
description: This chapter introduces the prerequisites of the installation of the ChimeStack platform.
weight: 2
---

### Network Requirements

##### Suggested Network Equipments

1. **1GB network for management**: The network for data transmission between management servers and computing nodes, and the network for provisioning the egress of the management service 
2. **10GB network for computing**: The network for provisioning data transmission among virtual machines
3. **10GB network for storage**: The network for provisioning data transmission between virtual machines and backend storage

##### Minimal Network Equipments

1. **1GB network for management**: The network for data transmission between management servers and computing nodes, and the network for provisioning the egress of the management service.
2. **10 GB network for computing and storage**: The combined network for provisioning data transmission among virtual machines, and between virtual machines and backend storages.

##### AllInOne Deployment's Network Equipment 

Only needs 1 network for provisioning the egress of the management service

### Management Node Requirements

| Resource | Requirement  | 
| ---- | ----- | 
| CPU   | 64-bit x86 architecture | 
| Memory | DDR4+ suggested | 
| Storage | HDD or SSD | 
| NIC   | 1GB ethernet network interface | 

### Management Node's Minimum Requirements

| resource  | AllInOne  | only server  | +mysql | +influxdb | +s3 | 10 nodes managed | 100 nodes managed |
| ---- | --------- | --------- | ----- | -------- | ---- | --------- | --------- |
| CPU   | 4 cores | 1 core | 1 core | 1 core | 1 core | 1 core | 4 cores |
| Memory   | 4GB | 2GB | 2GB | 2GB | 2GB | 2GB | 4GB | 
| Storage   | 40GB | 10GB | 10GB(SSD) | 10GB | 10GB | |

**Note**

ChimeStack utilizes MySQL for metadata storage and querying and utilizes influxdb for monitoring data storage and querying. You can configure different environments based on different instructional settings. For example (all the following are minimum settings):

- A chime-server deployed in the server node and managing 10 computing nodes requires: 2 cores/4GB memory/10GB SSD  
- A chime-server + mysql + influxdb deployed in the server node and managing 10 computing nodes require: 4 cores/8GB memory/50GB SSD
- A chime-server + mysql + influxdb + s3 deployed in the server node and managing 100 computing nodes require: 8 cores/ 12GB memory/70GB SSD

### Computing Node Requirements

| Resource  | Requirement |  
| ---- | ----- | 
| CPU   | 64-bit x86 architecture with Intel-VT/AMD-V，reserve 2 cores for chime-agent, other computing resources for virtualization | 
| Memory   | DDR4+ suggested, reserve 4 GB for chime-agent, other memory resource for virtualization | 
| Storage   | HDD or SSD, capacity depends on specific requirement |
| NIC   | 1GB network interface card, 2 10GB network interface cards | 