---
title: ChimeStack Features' Introduction(v0.1)
---

{{% blocks/cover title="ChimeStack功能介绍(v0.1)" image_anchor="top" height="10" color="primary"  %}}
{.mt-1}
{{% /blocks/cover %}}

{{% blocks/section color="default" type="row" %}}

## 1. Feature Introduction

<br></br>

### 1.1 Platform Management

- **Available Zone Management**
- **Cluster Management**
- **Node(Host)**
  - Lifecycle management
  - Failure migration management
- **存储池**
  - Local storage pool management
  - Ceph storage pool management
- **网络**
  - Layer-2 network management
  - Subnet management
- **镜像**
  - Image bucket management
  - Public image management
- **Instance specification management**
- **Volume specification management**

<br></br>

### 1.2 Virtual Resource Management

- **Virtual Machine**
  - Lifecycle management(create,start,stop,delete)
  - VM details(general information, volume information, NIC information, monitor, logs)
  - VM migration
  - VM change(volume add/remove, NIC add/remove)
- **Volume**
  - Lifecycle management(create, attach, detach, delete)
  - Volume details(general information、attached VMs, snapshot information, monitor、logs)
  - Support Ceph volume and local volume
  - Snapshot management(create, delete, restore to volume)
- **Elastic NIC**
  - Lifecycle management(create, attach, detach, delete)
  - NIC details(general information、attached VMs, monitor、logs)
- **Security Group**
  - Lifecycle management(create, change, delete)
  - Security group details(general information, rule information, attached VMs)
  - Only support IPv4
  
<br></br>

### 1.3 Monitoring and alarm management
- Cluster's monitoring data graphical display and alarm management
- Node monitoring data collection, retrieval, graphical display and alarm management
- Virtual resource monitoring data collection, retrieval, graphical display, and alarm management

<br></br>

### 1.4 Deployment and Configuration

- **The chimeadm Tool**
  - Provides configuration utilities for chime-server
  - Provides configuration utilities for chime-agent
  - Provides runtime statistic information.
- **AllInOne Installation Image**

<br></br>

### 1.5 Others

- User and Permission Management
- Limitation Management
- Dashboards

<br></br>

## 2. Components Introduction

<br></br>

### chime-server
Management and control plane program, communicates with chime-agents through gRPC protocol to deliver control commands. chime-server also integrates with a web portal. 

<br></br>

### chime-agent
Client-side program, running on computing nodes, receives the commands delivered from the chime-server and handles the virtualized resources on the node. 

<br></br>

### chimecli 
A command line management tool program.

<br></br>

### chimeadm
A deployment and configuration utility program, which can quickly configure the runtime parameters of the chime-server and the chime-agent.

{{% /blocks/section %}}
