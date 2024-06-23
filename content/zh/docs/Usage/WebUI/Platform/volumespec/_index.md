---
title: 云盘规格管理
description: 介绍云盘规格的管理方法
weight: 9
---

## 查看云盘规格
  * 点击"**筛选**"按钮，输入过滤条件，查询过滤后的云盘规格列表
  * 点击"**列过滤**"按钮，过滤需要显示在列表的信息，默认全部显示
  
{{% imgproc volumespec_list Fit "1000x600" %}}
云盘规格列表
{{% /imgproc %}}

## 新建云盘规格
  * 输入规格名称
  * 选择存储池
  * 输入最小IOPS
  * 输入最大IOPS
  * 输入IOPS步长
  * 输入最小带宽
  * 输入最大带宽
  * 输入带宽步长
  * (可选)描述信息

{{% pageinfo color="primary" %}}
云盘实际IOPS的计算公式为: iops = min(最大IOPS, size(GiB)*IOPS步长) 且 max(最小IOPS, size(GiB)*IOPS步长) 

云盘实际带宽的计算公式为: 带宽 = min(最大带宽, size(GiB)*带宽步长(MiB)) 且 max(最小带宽, size(GiB)*带宽步长(MiB)) 
{{% /pageinfo %}}

{{% imgproc volumespec_new Fit "1000x600" %}}
新建云盘规格
{{% /imgproc %}}

## 云盘规格管理
  * 点击"**编辑**"按钮编辑规格信息和参数
  * 点击"**删除**"按钮删除规格

## 关联云盘规格到集群
只有把云盘规格关联到集群后，集群才能正常使用该规格创建云盘，点击"**挂载到集群**"把一个云盘规格关联到一个或者多个集群。

{{% imgproc volumespec_relation Fit "1000x600" %}}
云盘规格关联到集群
{{% /imgproc %}}
