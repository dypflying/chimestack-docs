---
title: Host Management 
description: This chapter introduces how to manage hosts in ChimeStack
weight: 4
---

## Physical Nodes

If the chime-agent runs successfully for the first time after its installation in a computing node, the computing node is logged into the ChimeStack's database automatically, however so far the host still can not accommodate any virtual machine, the administrator must register the host to a specific cluster to make it available for the virtual resources in the cluster.

* Check physical node list
  * Click "**Filter**" button, input or select filter conditions, check the filtered physical node list
  * Click "**Columns**" button，select the columns to be displayed in the list，by default it shows all columns

{{% imgproc phyhost_list Fit "1000x600" %}}
physical nodes list page
{{% /imgproc %}}

* To registered a physical node to a specific cluster, click "**Register**"，input or choose the following node's information:
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

### Check registered node list
  * Click "**Filter**" button, input or select filter conditions, check the filtered registered node list
  * Click "**Columns**" button，select the columns to be displayed in the list，by default it shows all columns
{{% imgproc host_list Fit "1000x600" %}}
registered node list page
{{% /imgproc %}}

* Check node's details:
  * General information tab: show the general information of the node
  * Virtual machine information tab: list the virtual machines on the node
  * Layer-2 Network information tab: list the layer-2 networks on the node
  * Storage pool information tab: list the local storage pools on the node
  * System monitor tab: show the node's CPU and memory usage percentage in charts 
  * Net monitor tab: show the net I/O statistical information in charts 
  * Disk monitor tab: show the disk I/O and capacity statistical information in charts 
  * Alert information tab: show the unacknowledged alerts related to the host
  * Operation log tab: show the operation logs of the node. 

{{% imgproc host_vms Fit "1000x600" %}}
node's virtual machine list
{{% /imgproc %}}

{{% imgproc host_network Fit "1000x400" %}}
node's layer-2 network list
{{% /imgproc %}}

{{% imgproc host_storagepool Fit "1000x400" %}}
node's storage pool list
{{% /imgproc %}}

{{% imgproc host_sys_stat Fit "1000x400" %}}
node's system monitor information
{{% /imgproc %}}

{{% imgproc host_net_stat Fit "1000x400" %}}
node's network monitor information
{{% /imgproc %}}

{{% imgproc host_disk_stat Fit "1000x400" %}}
node's storage monitor information
{{% /imgproc %}}

{{% imgproc host_alert Fit "1000x400" %}}
node's unacknowledged alerts
{{% /imgproc %}}

{{% imgproc host_log Fit "1000x400" %}}
node's operation logs
{{% /imgproc %}}

### Update a node

  * Input the CPU's allocation ratio(default is 1.0), for instance, with a ratio of 1.0, a 16 cores CPU with 32 threads, can allocate up to 32 vCPUs for virtual machines; with a ratio of 2.0, can allocate up to 64 vCPUs for virtual machines.
  * Input the reserved CPUs, which are the CPU resources that will not be allocated to virtual machines, normally these CPU resources are reserved for the cloud platform's general components like the chime-agent running in the computing nodes. Especially in the hyper-converged scenario, the nodes must reserve enough physical resources for chime-agent and chime-stor or ceph's OSDs to reduce the resource conflict between the platform's components and the virtual machines.
  * Input the memory's allocation ratio.
  * Input the reserved memory.
  * (Optional) Input description.

{{% imgproc host_update Fit "1000x1000" %}}
Update a node
{{% /imgproc %}}

### Node management 

* Click "**Delete**" item button in the operation dropdown menu to unregister a host from current cluster. 
* Click "**Disable**" item button in the operation dropdown menu to disable a host, a disabled host will not destroy any virtual machines running on the host, but new virtual machines will not be scheduled on the host any more
* Click "**Enable**" item button in the operation dropdown menu to enable a host.
* Click "**Migrate**" item button in the operation dropdown menu to migrate all virtual machines of the node to other nodes, more details refer to [Solutions for node failures](/en/docs/usage/failure)
* Click "**Drain**" item button in the operation dropdown menu to stop all virtual machines on the node, and disable any new virtual machine is scheduled onto the node, more details refer to [Solutions for node failures](/en/docs/usage/failure)
* Click "**Rebuild**" item button in the operation dropdown menu rebuild same virtual machines as the node on other nodes, more details refer to [Solutions for node failures](/en/docs/usage/failure)

