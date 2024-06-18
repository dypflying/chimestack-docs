---
title: 关于 ChimeStack
linkTitle: 关于 ChimeStack
menu: {main: {weight: 10}}
---

{{% blocks/cover title="关于 ChimeStack" image_anchor="bottom" height="auto" %}}
私有云不再复杂
{.mt-5}

{{% /blocks/cover %}}

{{% blocks/lead %}}

**ChimeStack是轻量化的**

ChimeStack不像其它的私有云平台软件需要部署众多组件，平台运行时会占用较多的物理资源。ChimeStack云平台框架运行时只有管理服务进程(Chime-Server)、客户端进程(Chime-Agent)和存储服务进程(chime-stor)。其中chime-server仅运行在管控节点上，chime-agent和chime-stor运行在计算/存储节点上。这三个程序都为Golang语言开发，无过多的中间件依赖。

一个ChimeStack可以部署在AllInOne环境(单台服务器)，也可以部署在不超过100台服务器的生产环境。在AllInOne部署时，仅需要2核CPU和4GB内存的单服务器即可运行完整的私有云平台服务，并可以创建出5个的虚拟机系统。生产环境下，ChimeStack的管理服务进程(Chime-Server)和客户端进程(Chime-Agent)仅需要1核CPU和1G内存即可运行，这样物理资源可以充分进行虚拟化后提供给用户。

{{% /blocks/lead %}}

{{% blocks/lead %}}

**ChimeStack支持存算分离和存算融合**

ChimeStack既支持存算分离的场景，也支持存算融合的场景。

在融合场景下，ChimeStack自研的存算引擎(chime-stor)把虚拟机的I/O尽可能地调度到本地节点的存储介质上，极大地减少数据传输的跳跃次数和延迟,提高了I/O性能并且有效降低了网络带宽的占用。

在分离场景下，ChimeStack可以通过librbd协议对接Ceph集群，或者通过iSCSI协议对接其它块存储服务。  

{{% /blocks/lead %}}

{{% blocks/lead %}}

**ChimeStack是简单的**

ChimeStack不像其他的云平台软件需要部署众多组件，占用较多的系统资源的同时且运维成本高、对运维人员的技术要求也高。一个ChimeStack的设计初衷是无过多的中间件依赖、无复杂的模块间依赖拓扑，并尽可能的简化部署运维上的操作。10分钟即可完成部署和初始化一套AllInOne的单节点私有云环境。

ChimeStack提供友好的Web GUI和Cli命令行管控平台和虚拟化资源，以及提供SDK供二次开发。

{{% /blocks/lead %}}
