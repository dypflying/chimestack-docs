---
title: Host Management 
description: This chapter introduces how to manage hosts in ChimeStack
weight: 4
---

## Physical Nodes

集群安装完成后，一个运行chime-agent的节点会自动注册到系统里，但这时该节点还不能分配虚拟资源，即无法创建虚拟机，管理员需要把节点注册到单个集群中，才能分配物理资源。

* Check physical node list
  * Click **Filter** button, input or select filter conditions, check the filtered physical node list
  * Click **Columns** button，select the columns to be displayed in the list，by default it shows all columns

{{% imgproc phyhost_list Fit "1000x600" %}}
physical nodes list page
{{% /imgproc %}}

* To registered a physical node to a specific cluster, click **Register**，input or choose the following node's information:
  * Choose an availanle zone
  * Choose a cluster to register
  * Input the CPU's allocation ratio(default is 1.0), for instance, with a ratio of 1.0, a 16 cores CPU with 32 threads, can allocate up to 32 vCPUs for virtual machines; with a ratio of 2.0, can allocate up to 64 vCPUs for virtual machines.
  * Input the reserved CPUs, which are the CPU resources that will not be allocated to virtual machines, normally these CPU resources are reserved for the cloud platform's general components like the chime-agent running in the computing nodes. Especially in the hyper-converged scenario, the nodes must reserve enough physical resources for chime-agent and chime-stor or ceph's OSDs to reduce the resource conflict between the platform's components and the virtual machines.
  * Input the memory's allocation ratio.
  * Input the reserved memory.
  * (Optional) Input description.
{{% imgproc phyhost_register Fit "1000x1000" %}}
register a physical host to a cluster
{{% /imgproc %}}

## Registered Nodes

* Check registered node list
  * Click **Filter** button, input or select filter conditions, check the filtered registered node list
  * Click **Columns** button，select the columns to be displayed in the list，by default it shows all columns
{{% imgproc host_list Fit "1000x600" %}}
registered node list page
{{% /imgproc %}}

* Update host's properties
  * Input the CPU's allocation ratio(default is 1.0), for instance, with a ratio of 1.0, a 16 cores CPU with 32 threads, can allocate up to 32 vCPUs for virtual machines; with a ratio of 2.0, can allocate up to 64 vCPUs for virtual machines.
  * Input the reserved CPUs, which are the CPU resources that will not be allocated to virtual machines, normally these CPU resources are reserved for the cloud platform's general components like the chime-agent running in the computing nodes. Especially in the hyper-converged scenario, the nodes must reserve enough physical resources for chime-agent and chime-stor or ceph's OSDs to reduce the resource conflict between the platform's components and the virtual machines.
  * Input the memory's allocation ratio.
  * Input the reserved memory.
  * (Optional) Input description.
* Click **Delete** item button in the operation dropdown menu to unregister a host from its cluster. 
* Click **Disable** item button in the operation dropdown menu to disable a host, a disabled host will not destroy any virtual machines running in the host, but new virtual machines will not be scheduled in the host any more
* Click **Enable** item button in the operation dropdown menu to enable a host.
{{% imgproc host_update Fit "1000x1000" %}}
update node's properties
{{% /imgproc %}}

