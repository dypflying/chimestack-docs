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

ChimeStack不像其它的私有云平台软件需要部署众多组件，运维复杂，并且平台本身运行时会占用较多的物理资源。

ChimeStack最大化地精简了组件和第三方程序，ChimeStack运行时只有两个程序，即管理控制台程序(chime-server)和客户端程序(chime-agent)，它们都为Golang语言开发，无过多的中间件依赖。运行时占用极少的系统资源。

ChimeStack可以部署运行在单台(AllInOne)服务器中，也可以部署运行在不超过100台服务器的集群中。在AllInOne部署时，仅需要2核4GiB的内存的单节点即可运行完整的私有云平台，并且可以创建出不低于5个虚拟机系统。

{{% /blocks/lead %}}

{{% blocks/lead %}}

**ChimeStack支持存算分离和存算融合**

在分离场景下，计算集群和存储集群相互独立，分别独立管理和灵活扩缩容，整体提供云计算虚拟化服务。

在融合场景下，ChimeStack自研的存算引擎实现了I/O亲和性调度，即虚拟机存储数据的主副本在虚拟机运行的节点的存储介质上，缩短I/O路径，提高I/O效率。

{{% /blocks/lead %}}

{{% blocks/lead %}}

**ChimeStack是简单的**

ChimeStack提供友好的UI，CLI程序管理平台资源和虚拟化资源，并且提供全面的API和SDK可进行二次编程开发。

{{% /blocks/lead %}}
