---
title: ChimeStack Roadmap介绍
---

{{% blocks/cover title="ChimeStack Roadmap" image_anchor="top" height="10" color="primary"  %}}
{.mt-1}
{{% /blocks/cover %}}


{{% blocks/section color="default" type="row" %}}

- 版本 0.1 (已发布)
  - [ChimeStack V0.1 功能介绍](/release/landscape)
- 版本 0.2 (开发中，2024Q4发布)
  - ChimeStor存储，实现存储后端引擎、客户端(qemu)iSCSI接入、I/O亲和性调度、ChimeStor云盘生命周期管理。
  - 批量创建虚拟机、云盘、弹性网卡
  - 独享物理CPU类型虚拟机
  - 在线修改root密码
  - 在线升降虚拟机配置
  - 客户操作系统是否安装QGA探测
- 版本 0.3 (2025Q1)
  - ChimeStor存储类型快照功能
  - GPU虚拟化
  - 云盘扩容
  - 创建新虚拟机为关机状态
- 版本 1.0 (2025Q2)
  - 标签服务
  - 虚拟机亲和和反亲和调度
  - NFS存储类型
- 版本 1.1 (2025Q3)
  - VPC虚拟专有网
  - NAT网关
  - LB服务 

{{% /blocks/section %}}