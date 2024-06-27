---
title: 版本和下载
linkTitle: 版本介绍和下载
menu: {main: {weight: 30}}
weight: 30
---

{{% blocks/cover title="版本介绍及下载" image_anchor="top" height="10" color="green"  %}}
{.mt-8}
{{% /blocks/cover %}}

{{% blocks/section color="light" type="row" %}}
## 当前版本

|版本|说明|下载链接|
|----|----|-------|
|dev.0.1.1|安全组、限额管理|[下载](http://download.chimestack.io/dev.0.1.1/)|
|dev.0.1.2|资源锁优化、任务超时控制、报警通知管理、虚拟机创建时不启动|[下载](http://download.chimestack.io/dev.0.1.2/)|

{{% /blocks/section %}}
  
{{% blocks/section color="primary" type="row" %}}
## 路线图(RoadMap)

- 版本 0.1
  - [ChimeStack功能介绍(v0.1)](/release/deprecated)
- 版本 0.2 
  - ChimeStor
    - ChimeStor存储池
    - 客户端(qemu)iSCSI接入
    - ChimeStor云盘生命周期管理, I/O读写
    - ChimeStor快照生命周期管理
  - 云盘扩容、探测客户机是否安装QGA、修改root密码
- 版本 1.0 
  - 标签服务
  - 虚拟机亲和和反亲和调度
  - 物理CPU独占模式及Numa设定
  - GPU虚拟化
- 版本 1.1 
  - NFS存储池实现
  - Vlan二层网络
- 版本 2.0 
  - VPC虚拟专有网
  - NAT网关
  
{{% /blocks/section %}}

{{% blocks/section color="light" type="row" %}}
## 弃用版本

|版本|说明|
|----|----|
|dev.0.1.0|[ChimeStack功能介绍(v0.1)](/release/deprecated)|

{{% /blocks/section %}}

