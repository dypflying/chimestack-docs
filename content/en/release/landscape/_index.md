---
title: Introduction To ChimeStack V0.1 Features
---

{{% blocks/cover title="Introduction To ChimeStack Features" image_anchor="top" height="10" color="primary"  %}}
{.mt-1}
{{% /blocks/cover %}}

{{% blocks/section color="default" type="row" %}}

## 1. Feature Introduction

<br></br>

### 1.1 Platform Management

- **Available Zone Management**
- **Cluster Management**
- **Node(Host)**
  - Node's lifecycle management
  - Node's details (general information, virtual machines accommodated, related local networks, related storage pools, monitoring figures, alerts, operation logs)
  - Migration management for failures
- **Storage Pool**
  - Local storage pool management
  - Ceph storage pool management
- **Network**
  - Layer-2 network management
  - Subnet management
- **Image**
  - Image bucket management
  - Public image management
- **Instance specification management**
- **Volume specification management**

<br></br>

### 1.2 Virtual Resource Management

- **Virtual Machine and User Image**
  - VM's lifecycle management(create,start,stop,delete)
  - VM details(general information, attached volumes, attached Nics, monitoring figures, alerts, operation logs)
  - VM migration management
  - VM change(volume add/remove, NIC add/remove)
  - User image's lifecycle management
- **Volume and Snapshot**
  - Volume's lifecycle management(create, attach, detach, delete)
  - Volume details(general information、attached VMs, snapshots, monitoring figures, alerts, operation logs)
  - Support Ceph and local volumes
  - Snapshot's lifecycle management(create, delete, restore to volume)
- **Elastic NIC**
  - NIC's lifecycle management(create, attach, detach, delete)
  - NIC details(general information、attached VMs, monitoring figures, alerts, operation logs)
- **Security Group**
  - Security group's lifecycle management(create, change, delete)
  - Security group details(general information, rule information)
  - Support IPv4 and IPv6
  
<br></br>

### 1.3 Monitoring and Alert management
- Cluster's monitoring data graphical display and alart display
- Node's monitoring data collection, retrieval, graphical display and alart display
- Virtual machine's monitoring data collection, retrieval, graphical display, and alart display
- Volume's monitoring data collection, retrieval, graphical display, and alart display
- Network interface's monitoring data collection, retrieval, graphical display, and alart display
- Alert rule management
- Alert reveiver managemet
- Alert service's setting 

<br></br>

### 1.4 Deployment and Configuration

- **The chimeadm Tool**
  - Provides configuration functions for chime-server
  - Provides configuration functions for chime-agent
- **AllInOne Installation Image**

<br></br>

### 1.5 Command Line
- chimecli utility 

<br></br>

### 1.6 Others
- Dashboards
- Account and permission management
- Operation log Management

<br></br>

## 2. Components Introduction

<br></br>

### chime-server
Management and control plane program of Chimestack, user can interact with chime-server via server's API or SDK for managing the platform resources and the virtual resources. It communicates with chime-agents with gRPC protocol to deliver its control commands. chime-server also integrates with the chime-portal by default. 

<br></br>

### chime-agent
Client-side program, running on computing nodes, receives the commands delivered from the chime-server and handles both the physical resources and the virtualized resources on the node. 

<br></br>

### chimecli 
A command line tool program, which operate the chime-server through the SDK.

<br></br>

### chimeadm
A deployment and configuration utility program, by which can quickly configure the runtime settings of the chime-server and the chime-agent.

{{% /blocks/section %}}
