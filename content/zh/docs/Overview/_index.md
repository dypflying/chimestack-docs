---
title: 1 产品概述
description: 简要介绍ChimeStack是什么，有什么优势以及功能全景图
weight: 1
---

## ChimeStack是什么？

ChimeStack是新一代的轻量化云计算IaaS软件，基于虚拟化技术，实现物理硬件资源充分利用。ChimeStack适合于小规模私有云、边缘计算服务以及超融合场景。ChimeStack提供简单友好的WebUI和命令行CLI工具等，可以方便的运维管理私有云平台，最大化降低运维成本。 

## 为什么选择ChimeStack?

* **ChimeStack是轻量化的** ChimeStack框架中只包含管理服务进程(Chime-Server)和客户端进程(Chime-Agent)，它们都为Golang语言开发，无过多的中间件依赖。在AllInOne部署时，仅需要2核4GiB的内存的单节点即可运行完整的私有云平台，并且可以创建出不低于5个的虚拟机系统。生产环境下，ChimeStack的管理服务进程(Chime-Server)和客户端进程(Chime-Agent)仅占用物力资源低于1核CPU，1G内存以下，这样物理资源可以充分地作为可虚拟化资源提供给用户。

* **ChimeStack支持真正的超融合** ChimeStack支持存算分离的场景（对接Ceph系存储），也支持存算融合的场景。在融合场景下，ChimeStack自研的存算引擎(ChimeStor) 把虚拟机的I/O尽可能地调度到本地节点的存储介质上，极大地减少数据传输的跳跃次数和延迟,提高了I/O性能并且有效降低了网络带宽的使用。 
  
* **ChimeStack是简单的** ChimeStack不像其他的云平台软件需要部署大量的组件，占用较多的系统资源且运维成本高、对运维人员技术要求也高。ChimeStack的设计初衷是无过多的中间件依赖，并且无复杂的模块间依赖拓扑，尽可能的简化运维上的操作。10分钟即可完成部署和初始化一套AllInOne的私有云IaaS平台。


## ChimeStack功能全景图
{{% imgproc chime-landscape Fit "1500x650" %}}
{{% /imgproc %}}

