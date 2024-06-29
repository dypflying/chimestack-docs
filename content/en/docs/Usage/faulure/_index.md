---
title: 3.6 节点故障的处理方法 Node failure
weight: 6
description: 本章介绍ChimeStack的节点出现故障的处理方法
---

## 概述

当一个节点由于硬件、软件问题出现异常时，或者需要关机维护时，为了保障虚拟资源服务的可靠性、可用性，需要把节点上运行的虚拟服务(虚拟机实例、虚拟云盘等)迁移到其它功能正常的节点。如下图所示: 

![节点故障迁移](/images/chime-agent-ha.png)

一个节点可采取的运维方法包含:

* **迁移**: 把一个节点上所有的虚拟机资源在用户无感知的基础上迁移到其它节点上，适用场景:
  - 节点非宕机故障时虚拟机迁移
  - 节点维护时虚拟机迁移
* **清空**: 把一个节点上所有运行的虚拟机停止，适用场景:
  - 防止脑裂，在其它节点重建虚拟机前，需要停止该节点虚拟机
  - 节点关机维护
* **重建**: 在其它节点重新创建同样的虚拟机实例，适用场景:
  - 节点宕机故障时虚拟机迁移

下面分别介绍这三种节点故障处理方法。

## 节点迁移功能

迁移功能是通过libvirt把虚拟机实例在其运行或者停止状态下，从一个物理节点迁移到另一个物理节点，迁移的过程不影响用户正常使用虚拟机。
迁移可以通过管控面发起，即Web UI或者CLI(chimecli)发起迁移指令。也可以通过数据面发起，即通过chime-agent发起迁移指令，但通过chime-agent进行迁移通常是只是一种当管控面无法正常控制节点情况下，故障的运维手段，不是常规操作，非必要尽量不使用。
节点迁移过程中数据复制可以通过任意联通的网络完成，如果节点迁移是通过chime-server发起的，则迁移数据(内存拷贝)是通过"管理网"完成的; 如果节点迁移是通过chime-agent发起的，则可以选择网络网、业务网或者存储网(如果有)进行迁移数据。

### 通过Web UI迁移

在"**节点管理**"页面，选中要迁移的节点，在"**操作**"栏目中，点击"**迁移**"菜单项，弹出迁移选项页: 

{{% imgproc node_migrate Fit "700x400" %}}
节点迁移
{{% /imgproc %}}

其中选择以下选项开始迁移: 

- **目标节点**: 可选则一个目标节点，当前节点上的所有虚拟机都将迁移到目标节点，如果目标节点的资源(CPU,内存,存储)不足以安置全部的虚拟机，则迁移会失败。如果不选择目标节点，则系统会自动安排被迁移的虚拟机到集群内其它节点上。
- **迁移带本地盘的虚拟机**: 如果选中该选项，即使虚拟机包含本地硬盘，也会被一起迁移。需要注意的是，迁移带本地硬盘的虚拟机会消耗大量的网络带宽以及物理CPU等资源，而且耗时较长，迁移时间和本地硬盘实际使用的数据量大小成正比，因为迁移带本地盘的虚拟机，除了要进行内存拷贝，还需要将硬盘数据也一起拷贝。该选项默认不选中，即节点的迁移会忽略掉带本地硬盘的虚拟机。 

迁移执行后，节点的状态机会被锁定，迁移完成后节点的信息会被更新(节点虚拟机数量、迁移任务的执行情况等)。

### 通过chimecli迁移

命令原型:

```
 chimecli host migrateHost [flags]

Flags:
      --AzUuid string                              Required. the AZ's uuid
      --Body string                                Optional json string for [Body]. the http post body
      --ClusterUuid string                         Required. the cluster's uuid
      --HostUuid string                            Required. the host's uuid
  -h, --help                                       help for migrateHost
      --migrateHostRequest.MigrateLocalDiskVms     whether to migrate the virtual machines with local disks (default is false)
      --migrateHostRequest.TargetHostUuid string   the target host's uuid, system will automatically assign one host if omit
```

参数说明：
- **migrateHostRequest.MigrateLocalDiskVms**: (可选)迁移带本地盘的虚拟机
- **migrateHostRequest.TargetHostUuid**: (可选)目标节点的Uuid

示例:

```
   chimecli host migrateHost \
      --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
      --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
      --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a \
      --migrateHostRequest.MigrateLocalDiskVms \
      --migrateHostRequest.TargetHostUuid 12345678-1112-449d-8d3e-3ff8b1323d9e 

```

### 通过chime-agent迁移

{{% alert title="提示" color="primary" %}}
和由管控面发起的节点迁移不同，通过chime-agent迁移节点上的虚拟机，必须指定一个迁移用的网络和一个目标节点
{{% /alert %}}

命令原型:

```
  chime-agent migrate 

Flags:
  --interface <interface name>
  --dest <target ip>
  --vm_uuid [vm uuid]
  --all 
  --confirm 
```

参数说明:

- **interface**: 指定迁移数据用的网络接口名称
- **dest**: 指定目标节点IP
- **vm_uuid**: (可选)单个虚拟机迁移，这个参数和all二者必须选一
- **all**: 迁移节点上全部虚拟机，这个参数和vm_uuid二者必须选一
- **confirm**: 该参数代表执行实际的迁移动作，否者只会校验命令行参数

示例:

```
  chime-agent migrate \
  --interface eth1 \
  --dest 10.10.10.3 \
  --all \
  --confirm 
```

## 节点清空功能

节点清空功能即把一个节点上所有的虚拟机停机，并且把该节点的管控状态标记为"清空"，不再接受新虚拟机的调度。这个功能除了能批量地关闭节点上的虚拟机外，它更主要是为了应对节点故障宕机的严重异常设计的。当节点由于硬件严重故障宕机后，如果不能快速恢复，需要把节点上的虚拟机迁移到其它节点，但由于节点宕机的原因无法通过libvirt进行迁移，只能在其它节点重建这些虚拟机，虚拟机重建后，必须确保故障节点的虚拟机不会重新运行进而导致"脑裂"现象的发生，所以必须在"重建"操作前，对故障节点进行"清空"操作，保证任意时刻，虚拟机资源的唯一性。

### 通过Web UI清空

在"**节点管理**"页面，选中要迁移的节点，在"**操作**"栏目中，点击"**清空**"菜单项，弹出确认对话框后，点击"**确认**"执行清空操作，清空任务执行时节点的状态机会被锁定，完成后节点的信息会被更新(节点虚拟机数量、清空任务的执行情况等)。

{{% imgproc node_drain Fit "480x350" %}}
节点清空
{{% /imgproc %}}


### 通过chimecli清空

命令原型:

```
  chimecli host drainHost [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --HostUuid string      Required. the host's uuid
```

示例:

```
   chimecli host drainHost \
      --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
      --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
      --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a 

```

### 通过chime-agent清空

命令原型:

```
  chime-agent drain 

Flags:
  --confirm 
```

参数说明:

- **confirm**: 该参数代表执行实际的清空动作

示例:

```
  chime-agent drain --confirm 
```

## 重建

根据"节点清空"的功能说明，"清空"+"重建"的功能是为了应对节点宕机时，故障节点上虚拟机服务能够快速恢复的运维方法。重建功能是把故障节点的全部虚拟机在其它正常的节点重新创建。需要特别注意以下几点: 
1. 故障节点上带有本地盘的虚拟机，在节点"重建"的过程中，不会被重建，因为本地盘的数据由于宕机原因无法进行拷贝，所以使用本地盘的虚拟机的可靠性本身就受限于节点的可靠性，一般不推荐使用带本地盘的虚拟机。
2. 重建任务只能从管控端发起(Web Ui或chimecli)，不能从chime-agent端发起。
3. 只有处于"已清空"状态的节点才能执行"重建"操作。

### 通过Web UI重建

在"**节点管理**"页面，选中要迁移的节点，在"**操作**"栏目中，点击"**重建**"菜单项，弹出确认对话框后，点击"**确认**"执行重建操作，重建任务执行时节点的状态机会被锁定，完成后节点的信息会被更新(节点虚拟机数量、重建任务的执行情况等)。

{{% imgproc node_rebuild Fit "900x300" %}}
节点重建
{{% /imgproc %}}

### 通过chimecli重建

命令原型:

```
  chimecli host rebuildHost [flags]

Flags:
      --AzUuid string                              Required. the AZ's uuid
      --Body string                                Optional json string for [Body]. the http post body
      --ClusterUuid string                         Required. the cluster's uuid
      --HostUuid string                            Required. the host's uuid
      --rebuildHostRequest.TargetHostUuid string   the target host's uuid, system will automatically assign one host if omit
```

参数说明：
- **rebuildHostRequest.TargetHostUuid**: (可选)目标节点的Uuid

示例:

```
   chimecli host rebuildHost \
      --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
      --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
      --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a \
      --migrateHostRequest.TargetHostUuid 12345678-1112-449d-8d3e-3ff8b1323d9e 
```