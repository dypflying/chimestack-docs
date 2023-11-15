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

ChimeStack是一个轻量化的私有云平台软件。

ChimeStack不像其它的私有云平台软件需要部署许多组件，占用系统较多的资源而且运维成本高。精简部署时，ChimeStack只有两个守护进程 —— 管理控制进程和客户端进程，极少依赖中间件和第三方程序。

{{% /blocks/lead %}}

{{% blocks/lead %}}

ChimeStack支持存算分离和存算融合的场景，在融合场景下，ChimeStack自研的存算引擎实现了I/O亲和性调度，即虚拟机存储的主副本在虚拟机运行的节点的存储介质上，缩短了I/O路径，提高了I/O效率。

{{% /blocks/lead %}}

{{% blocks/lead %}}

ChimeStack框架中只包含管理服务进程(Chime-Server)和客户端进程(Chime-Agent)，它们都为Golang语言开发，无过多的中间件依赖。在AllInOne部署时，仅需要2核4GiB的内存的单节点即可运行完整的私有云平台，并且可以创建出不低于5个虚拟机系统。

{{% /blocks/lead %}}
