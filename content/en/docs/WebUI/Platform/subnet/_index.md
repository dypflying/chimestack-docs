---
title: Subnet Management
description: This chapter introduces how to manage subnets in ChimeStack
weight: 6
---

* 查看子网列表
  * 点击**筛选**按钮，输入过滤条件，查询过滤后的子网列表
  * 点击**列过滤**按钮，过滤需要显示在列表的信息，默认全部显示
  
{{% imgproc subnet_list Fit "1000x600" %}}
子网列表
{{% /imgproc %}}

* 新建子网
  * 输入子网名称
  * 选择网络
  * 输入CIDR
  * 输入网关（如果不输入，默认为CIDR对应网络IP段的第一个IP）
  * (可选)描述信息
  
{{% imgproc subnet_new Fit "1000x600" %}}
新建子网
{{% /imgproc %}}

* 子网管理
  * 点击**编辑**更新子网基本信息
  * 点击**删除**删除一个子网