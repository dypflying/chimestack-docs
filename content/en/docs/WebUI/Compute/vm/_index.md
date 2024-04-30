---
title: Virtual Machine
description: This chapter introduces how to manage the lifecycle of virtual machines
weight: 2
---

## Check Virtual Machines

* Check virutal machine list：
  * To change current cluster, click **Change Cluster** and then select **Zone** and **Cluster**
  * Click **filter** button, input or select filter conditions, check the filtered virtual machine list
  * Click **columns** button，select the columns to be displayed in the list，by default it shows all columns
* To view a virtual machine's details, select the virutal machine in the list，detailed information will be showed in the below panel.
  * General information tab: show the general information of the virtual machine
  * Volumes information tab: list the attached volumes' information of the virtual machine 
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

* Input following items in the "Login" tab:
  * (Optional) the password for the root user，**Note: if the guest OS doesn't have the cloud-init installed, the password will not be taken into effect**。
  * (Optional) the password for the vnc login
{{% imgproc newvmlogin Fit "1000x600" %}}
{{% /imgproc %}}

* Input or choose following items in the "Add Virtual Hardware" tab:
  * CDRom device, if set the CDRom as boot device, so the system will boot from this CDRom 
  * Up to 32 data volumes can be added to the virtual machine 
  * Up to 8 network interfaces can be added to the virtual machine
{{% imgproc newvmdevices Fit "1000x1500" %}}
{{% /imgproc %}}

### Update Virtual Machine's Information

{{% imgproc vmupdate Fit "800x600" %}}
{{% /imgproc %}}

### Virtual Machine's Lifecycle Management 

* **Start**: You can start the virtual machines which are in "Stopped" or "Start Failure" states by clicking the "Start" item button in the operation list, starting a virtual machine is an async operation, and it will automatically refresh the operation's status on the list page. 
* **Stop**: You can stop the virtual machines which are in "Running" or "Stop Failure" states by clicking the "Stop" item button in the operation list, stopping a virtual machine is an async operation, and it will automatically refresh the operation's status on the list page. 
* **Delete**: You can delete the virtual machines which are in "Stopped" or "Delete Failure" states by clicking the "Delete" item button in the operation list, deleting a virtual machine is an async operation, and it will automatically refresh the operation's status on the list page. 
  
{{% alert title="Warning" color="warning" %}}
The deleted virtual machines can not be restored anymore, and the attached resources of the virtual machines can not be restored either
{{% /alert %}}

### Batch Operation

* **Batch Start**: Choose multiple stopped virtual machines and click the "Start" item in the batch action's dropdown menu to start them simultaneously.
* **Batch Stop**: Choose multiple running virtual machines and click the "Stop" item in the batch action's dropdown menu to stop them simultaneously.
* **Batch Delete**: Choose multiple stopped virtual machines and click the "Delete" item in the batch action's dropdown menu to delete them simultaneously.

## Volumes And NICs Management

### Data Volumes Management
* In the virtual machine's details page, choose a data volume to be detached from the volumes list, click "Detach" button item in the "Operation" dropdown menu to trigger a detaching volume task。**Note: root volume is not detachable**
* In the virtual machine's details page, click "Attach Volume" button, choose the volume to be attached from the popup window and click "Save" to trigger a attaching volume task. Note: Ceph volumes belong to current user are attachable; while only local volumes in the same computing node with the virtual machine can be attached 
{{% imgproc attach_volume Fit "800x400" %}}
{{% /imgproc %}}

### Elatic Network Interfaces Management
* In the virtual machine's details page，choose a non-primary network interface to be detached from the network interface list, click "Detach" button item in the "Operation" dropdown menu to trigger a detaching network interface task。**Note: primary network interface is not detachable**
* In the virtual machine's details page, click "Attach Interface" button, choose the network interface to be attached from the popup window and click "Save" to trigger a attaching network interface task. 
{{% imgproc attach_nic Fit "800x400" %}}
{{% /imgproc %}}