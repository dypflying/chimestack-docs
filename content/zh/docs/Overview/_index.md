---
title: 1 产品概述
description: 简要介绍ChimeStack是什么，有什么优势以及功能全景图
weight: 1
---

## ChimeStack是什么？

ChimeStack是一个轻量化的云计算基础设施即服务(IaaS)软件，通过ChimeStack可以帮助企业/组织快速地构建和管理企业私有云环境。ChimeStack对超融合环境中存储和计算的I/O路径进行了优化，提升了I/O效率。ChimeStack让部署运维私有云环境变得尤其简单，并最大化地减少了云平台组件对系统资源的消耗，使其更适用于小规模私有云、边缘计算服务场景。ChimeStack提供简单友好的WebUI和命令行工具(Cli)管理平台和虚拟化资源。 

## 为什么选择ChimeStack?

* **ChimeStack是轻量化的** ChimeStack云平台框架运行时只有管理服务进程(Chime-Server)、客户端进程(Chime-Agent)和存储服务进程(chime-stor)。其中chime-server仅运行在管控节点上，chime-agent和chime-stor运行在计算/存储节点上。这三个程序都为Golang语言开发，无过多的中间件依赖。在AllInOne部署时，仅需要2核CPU和4GB内存的单节点服务器即可运行完整的私有云平台，并可以创建出5个的虚拟机系统。生产环境下，ChimeStack的管理服务进程(Chime-Server)和客户端进程(Chime-Agent)仅需要1核CPU和1G内存即可运行，这样物理资源可以充分进行虚拟化后提供给用户。

* **ChimeStack同时支持存算融合场景和分离场景** ChimeStack既支持存算分离的场景，也支持存算融合的场景。在融合场景下，ChimeStack自研的存算引擎(chime-stor)把虚拟机的I/O尽可能地调度到本地节点的存储介质上，极大地减少数据传输的跳跃次数和延迟,提高了I/O性能并且有效降低了网络带宽的占用。在分离场景下，ChimeStack可以通过librbd协议对接Ceph集群，或者通过iSCSI协议对接其它块存储服务。  
  
* **ChimeStack是运维友好的** ChimeStack不像其他的云平台软件需要部署大量的组件，占用较多的系统资源的同时且运维成本高、对运维人员的技术要求也高。一个ChimeStack的设计初衷是无过多的中间件依赖、无复杂的模块间依赖拓扑，并尽可能的简化部署运维上的操作。10分钟即可完成部署和初始化一套AllInOne的单节点私有云环境。另外，ChimeStack提供友好的Web GUI和Cli命令行管控平台和虚拟化资源，以及提供SDK供二次开发。


## ChimeStack功能全景图
{{% imgproc chime-landscape Fit "1500x650" %}}
{{% /imgproc %}}

