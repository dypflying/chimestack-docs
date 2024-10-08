---
title: ChimeStack V0.1 功能介绍
---

{{% blocks/cover title="ChimeStack V0.1 功能介绍" image_anchor="top" height="10" color="primary"  %}}
{.mt-1}
{{% /blocks/cover %}}

{{% blocks/section color="default" type="row" %}}

## 1. 功能介绍

<br></br>

### 1.1 平台管理

- **可用区管理**
- **集群管理**
- **节点**
  - 节点生命周期管理
  - 节点详情(基本信息、虚拟机信息、本地网络信息、本地存储池信息、监控数据、报警信息、操作日志)
  - 节点故障迁移管理
- **存储池**
  - 本地存储池管理
  - Ceph存储池管理
- **网络**
  - 二层网络管理
  - 子网管理
- **镜像**
  - 镜像桶管理
  - 公有镜像管理
- **虚拟机实例规格管理**
- **云盘规格管理**

<br></br>

### 1.2 虚拟资源管理

- **虚拟机和镜像**
  - 虚拟机生命周期管理(创建、启动、停止、删除)
  - 虚拟机详情(基本信息、挂载云盘信息、挂载网卡信息、监控数据、报警信息、操作日志)
  - 虚拟机迁移(在线、离线)
  - 虚拟机变更(云盘增删、网卡增删)
  - 用户私有镜像生命周期管理
- **云盘和快照**
  - 云盘生命周期管理(创建、挂载、卸载、删除)
  - 云盘详情(基本信息、挂载虚拟机信息、快照信息、监控数据、报警信息、操作日志)
  - 支持Ceph云盘和本地云盘
  - 快照生命周期管理(创建、删除、从快照恢复到盘)
- **弹性网卡**
  - 网卡生命周期管理(创建、挂载、卸载、删除)
  - 网卡详情(基本信息、挂载虚拟机信息、监控数据、报警信息、操作日志)
- **安全组**
  - 生命周期管理(创建、变更、删除)
  - 安全组详情(基本信息、规则信息)
  - 支持IPv4和IPv6
  
<br></br>

### 1.3 监控和报警管理
- 集群监控数据图形化展示和报警信息查看
- 节点监控数据收集、检索、图形化展示和报警信息查看
- 虚拟机实例监控数据收集、检索、图形化展示和报警信息查看
- 云硬盘监控数据收集、检索、图形化展示和报警信息查看
- 弹性网卡监控数据收集、检索、图形化展示和报警信息查看
- 报警规则管理
- 报警接收者管理
- 全局报警服务设置

<br></br>

### 1.4 部署和配置

- **chimeadm工具管理**
  - 管控侧配置
  - 节点侧配置
- **AllInOne安装镜像**

<br></br>

### 1.5 命令行
- chimecli命令行工具

<br></br>

### 1.6 其它

- 用户仪表盘
- 用户和权限管理
- 操作日志管理

<br></br>

## 2. 组件介绍

<br></br>

### chime-server
ChimeStack的管控服务程序，用户通过server API或SDK来管控平台资源或虚拟化资源, chime-server与chime-agent之间通过gRPC通信, 下发管控指令对节点侧的资源实现管控。 chime-server默认集成chime-portal。

<br></br>

### chime-agent
客户端程序，运行在计算节点上，接收chime-server下发的管控命令，对虚拟资源和平台资源实际操作。

<br></br>

### chimecli 
管控端命令行工具，通过SDK实现对chime-server的操作

<br></br>

### chimeadm
部署配置工具，可快速地配置chime-server和chime-agent运行时的各种参数。

{{% /blocks/section %}}
