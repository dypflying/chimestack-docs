---
title: 虚拟机
description: 本章节介绍虚拟机全生命周期的管理方法
weight: 2
---

## 查看虚拟机

* Check virutal machine list：
  * To change current cluster, click **Change Cluster** and then select **Zone** and **Cluster**
  * Click **filter** button, input or select filter conditions, check the filtered virtual machine list
  * Click **columns** button，select the columns to be displayed in the list，by default it shows all columns
* View virtual machine's details: select the virutal machine in the list，detailed information will be showed in the below panel.
  * General information tab: show the general information of the virtual machine
  * Volumes information tan: list the attached volumes' information of the virtual machine 
  * Network interfaces information tab: list the attached network interfaces' information of the virtual machine 
  * System monitor tab: Show the virtual machine's CPU and memory usage percentage in charts 
  * I/O monitor tab: Show the virtual machine's overall statistics of its disk I/O and network I/O in charts

{{% imgproc vmlist Fit "1000x1000" %}}
virtual machine's list and details 
{{% /imgproc %}}

{{% imgproc vmstorage Fit "1000x500" %}}
attached volumes list
{{% /imgproc %}}

{{% imgproc vmnic Fit "1000x500" %}}
attached elastic network interfaces list
{{% /imgproc %}}

{{% imgproc vmsysperf Fit "1000x500" %}}
virtual machine's CPU and memory usage percentage
{{% /imgproc %}}

{{% imgproc vmioperf Fit "1000x500" %}}
virtual machine's overall statistics of disk I/O and network I/O
{{% /imgproc %}}

## Virtual Machine Management

### Create New Virtual Machine
* Input or choose following items in the "Basic" information tab:
  * Input name of the virtual machine, it is restricted to 2～64 characters
  * (Optional) input description
  * Choose one of the instance specifications 
  * Choose one of the volume specifications for the root volume
  * Input size of the root volume (GiB) 
  * (Optional) Choose a bootable image (can be searched by image bucket type, format and OS type)，if no bootable image selected，you must add a bootable CDRom as the primary boot device in the "Add Virtual Hardware" tab, otherwise there is no bootable device for the virtual machine to startup.
  * Choose a newwork
  * Choose a subnet

{{% imgproc newvmgeneral Fit "1000x1500" %}}
{{% /imgproc %}}

* 在"登录"页输入:
  * (可选) ssh root用户的初始密码，**注意,如果客户端操作系统没有安装cloud-init，该设置将不会生效**。
  * (可选) vnc 控制台的登录密码
{{% imgproc newvmlogin Fit "1000x600" %}}
{{% /imgproc %}}

* 在"添加虚拟设备"页输入或选择:
  * CDRom设备，如果选择"从CDRom"启动，则该CDRom作为引导盘启动
  * 可以添加最多32块数据云盘
  * 可以添加最多8个网卡
{{% imgproc newvmdevices Fit "1000x1500" %}}
{{% /imgproc %}}

### 更新虚拟机信息

{{% imgproc vmupdate Fit "800x600" %}}
{{% /imgproc %}}

### 虚拟机生命周期管理

* **启动**: 对于处于"停止"或者"启动失败"状态下的虚拟机，在虚拟机列表"操作"列点击"启动"开始异步的启动任务, 页面会自动刷新并更新任务状态。
* **停止**: 对于处于"运行中"或者"停止失败"状态下的虚拟机，在虚拟机列表"操作"列点击"停止"开始异步的停止任务, 页面会自动刷新并更新任务状态。
* **删除**: 对于处于"停止"状态的虚拟机，在虚拟机列表"操作"列点击"删除"开始异步的删除任务, 页面会自动刷新并更新任务状态。
{{% alert title="警告" color="warning" %}}
删除虚拟机后虚拟机不能再恢复，虚拟机关联的资源也会被释放
{{% /alert %}}

### 批量操作

* **批量启动**: 可以选择多个"停止"状态的虚拟机一起启动，页面会自动刷新并更新任务的状态。
* **批量停止**: 可以选择多个"运行中"状态的虚拟机一起停止，页面会自动刷新并更新任务的状态。
* **批量删除**: 可以选择多个"停止"状态的虚拟机一起删除，页面会自动刷新并更新任务的状态。

## 关联设备的管理

### 挂载、卸载数据云盘
* 在虚拟机详情页，"云盘"列表页中选择要卸载的云盘，点击"操作"菜单的"卸载"，启动卸载任务。**注意，根云盘不能卸载**
* 在虚拟机详情页，点击"挂载云盘", 弹出窗口中选择要挂载的云盘完成挂载，对于Ceph云盘，可选择该用户下所有可用(未挂载)的Ceph Image，对于本地存储，只能选择当前节点上的云盘。
{{% imgproc attach_volume Fit "800x400" %}}
{{% /imgproc %}}

### 挂载、卸载弹性网卡
* 在虚拟机详情页，"网卡"列表页中选择要卸载的网卡，点击"操作"菜单的"卸载"，启动卸载任务。**注意，主网卡不能卸载**
* 在虚拟机详情页，点击"挂载网卡", 弹出窗口中选择要挂载的可用网卡进行挂载。
{{% imgproc attach_nic Fit "800x400" %}}
{{% /imgproc %}}