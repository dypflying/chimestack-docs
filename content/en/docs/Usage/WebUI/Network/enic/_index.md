---
title: Elastic Interface
description: This chapter introduces how to manage elastic interfaces
weight: 2
---


## Check Network Interfaces

* Check network interface list:
  * To change current cluster, click **Change Cluster** and then select **Zone** and **Cluster**
  * Click **filter** button, input or select filter conditions, check the filtered network interfaces list
  * Click **columns** button，select the columns to be displayed in the list，by default it shows all columns
* To view a network interface's details, select the network interface in the list，detailed information will be showed in the below panel.
  * General information tab: show the general information of the network inerface
  * Attached instances tab: show the virtual machine instance to which the network interface attaches
  * Network interface monitor tab: Show the network interface's I/O statistical information in charts
  
{{% imgproc nic_list Fit "1000x600" %}}
network interfaces list page
{{% /imgproc %}}

{{% imgproc nic_attach Fit "1000x400" %}}
virtual machines to which the network interface attaches
{{% /imgproc %}}

{{% imgproc nic_stat Fit "1000x400" %}}
network interface's I/O monitor
{{% /imgproc %}}

## Create Network Interface
* Input or choose:
  * Input name of the network interface, it is restricted to 2～64 characters
  * (Optional) input description
  * Choose a newwork
  * Choose a subnet
  * (Optional) Input an IP address
  
{{% imgproc nic_new Fit "1000x400" %}}
create network interface
{{% /imgproc %}}

### Update Network Interface's Information

{{% imgproc nic_update Fit "800x500" %}}
{{% /imgproc %}}

## Network Interface's Lifecycle Management 
* **Attach**: you can attach network interfaces which are in the "Available" or "Attach Failure" states by clicking the "Attach" item button in the operation list to attach the network interface to a specific virtual machine. You can also attach a network interface to a virtual machine in the virtual machine's details page.
* **Detach**: you can detach network interfaces which are in the "Attached" or "Detach Failure" states by clicking the "Detach" item button in the operation list to detach the network interface from a virtual machine. You can also detach the network interface from the virtual machine in the virtual machine's details page. Note: the primary network interface is not detachable
* **Delete**: You can delete the network intetfaces which are in "Available" or "Delete Failure" states by clicking the "Delete" item button in the operation list. Note: Deleted interfaces can not be restored.
  
### Batch Delete

 Choose multiple network intetfaces in the "Available" state and click the "Delete" item in the batch action's dropdown menu to delete them simultaneously.

