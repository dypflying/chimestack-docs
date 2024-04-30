---
title: Layer-2 Network Management
description: This chapter introduces how to manage layer-2 networks in ChimeStack
weight: 5
---

* 查看二层网络列表
  * 点击**筛选**按钮，输入过滤条件，查询过滤后的网络列表
  * 点击**列过滤**按钮，过滤需要显示在列表的信息，默认全部显示

{{% imgproc network_list Fit "1000x600" %}}
二层网络列表页
{{% /imgproc %}}

* 新建二层网络
  * 输入网络名称
  * 选择网络类型(经典二层网络, VLAN网络和VxLan网络)，目前仅支持经典网络
  * 输入网卡名称
  * (可选)描述信息
{{% alert title="警告" color="warning" %}}
注意：网卡名称必须是集群所有物理中真实的网卡名称，如果网卡名称不统一，请参考"网卡归一化"章节。
{{% /alert %}}

{{% imgproc network_new Fit "1000x600" %}}
新建二层网络
{{% /imgproc %}}

* 二层网络管理
  * 点击**编辑**更新网络基本信息
  * 点击**删除**删除一个网络
  * 点击**子网管理**跳转到该网络的子网管理页面
