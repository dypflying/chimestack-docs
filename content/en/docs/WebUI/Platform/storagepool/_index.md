---
title: Storage Pool Management
description: This chapter introduces how to manage storage pools in ChimeStack
weight: 8
---

* 查看存储池列表
  * 点击**筛选**按钮，输入过滤条件，查询过滤后的虚拟机列表
  * 点击**列过滤**按钮，过滤需要显示在列表的信息，默认全部显示

{{% imgproc pool_list Fit "1000x600" %}}
存储池列表
{{% /imgproc %}}

* 新建存储池
  * 输入存储吃名称
  * 选择存储池类型
    * 本地存储: 节点上的物理盘存储
    * Ceph存储: Ceph集群的存储资源
  * (仅本地存储) 后端的存储路径
  * (仅本地存储) 缓存盘的存储路径 
  * 容量分配比
  * 物理容量(GiB)
  * 保留容量(GiB)
  * (可选)描述信息
{{% imgproc pool_new Fit "1000x600" %}}
新建存储池
{{% /imgproc %}}

* 存储池管理
  * 点击**编辑**按钮编辑存储池信息和参数
  * 点击**删除**按钮删除存储池