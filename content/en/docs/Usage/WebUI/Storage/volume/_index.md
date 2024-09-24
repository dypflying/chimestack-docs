---
title: Volume
description: This chapter introduces how to manage the lifecycle of volumes
weight: 2
---

## Volume List

* Check volumes list：
  * To change current cluster, click "**Change Cluster**" and then select "**Zone**" and "**Cluster**"
  * Click "**filter**" button, input or select filter conditions, check the filtered volumes list
  * Click "**columns**" button，select the columns to be displayed in the list，by default it shows all columns
* To view a volume's details, select a volume in the list，detailed information will be showed in the below panel.
  * General information tab: show the general information of the volume
  * Attached instances tab: show the virtual machine instance to which the volume attaches
  * Snapshot tab: show the snapshots of the volume
  * Volume monitor tab: Show the volume's I/O and capacity statistical information in charts
  * Alert tab: show the unacknowledged alerts related to the volume.
  * Operation log tab: Show the the volume's operation logs
  
{{% imgproc volume_list Fit "1000x1000" %}}
volume list page
{{% /imgproc %}}

{{% imgproc volume_attach Fit "1000x400" %}}
virtual machine instances attached by the volume
{{% /imgproc %}}

{{% imgproc volume_snapshot Fit "1000x400" %}}
volume's snapshot list 
{{% /imgproc %}}

{{% imgproc volume_stat Fit "1000x400" %}}
volume's I/O and capacity monitor
{{% /imgproc %}}

{{% imgproc volume_alert Fit "1000x400" %}}
volume's related unacknowledged alerts
{{% /imgproc %}}

{{% imgproc volume_logs Fit "1000x400" %}}
volume's operation logs
{{% /imgproc %}}

## Create New Volume
* Input or choose the following information:
  * Input the name of the volume, which is restricted to 2～64 characters and only allows alphbet, number, “-” and “_”.
  * (Optional) Input description
  * Choose a volume specification
  * Input the size of the volume
  * (Optional) If the volume specification is on a local storage pool, you must choose a host at which to create the local volume.
  
{{% imgproc volume_new Fit "1000x400" %}}
create new volume
{{% /imgproc %}}

## Volume's lifecycle management 
* **Attach**: you can attach a volume which is in the "Available" or "Attach Failure" state by clicking the "Attach" item button in the operation list to attach the volume to a specific virtual machine. You can also attach a volume to a virtual machine in its details page. 
* **Detach**: you can detach a volume which is in the "Attached" or "Detach Failure" state by clicking the "Detach" item button in the operation list to detach the volume from a virtual machine. You can also detach the volume from the virtual machine in its details page. Note: the root volume is not detachable
* **Delete**: You can delete the volumes which are in "Available" or "Delete Failure" state by clicking the "Delete" item button in the operation list. Note: Deleted volumes can not be restored.
  
### Batch Delete

Choose multiple volumes in the "Available" state and click the "Delete" item in the batch action's dropdown menu to delete them simultaneously.

## Make snapshots and restore a volume from snapshots 
* **Make snapshot**: click the "Take Snapshot" item button in the operation dropdown menu to make a snapshot of the volume. You can check the snapshot in the volume's details panel.
{{% imgproc volume_new_snapshot Fit "1000x400" %}}
resotre volume from a snapshot
{{% /imgproc %}}
* **Delete Snapshot**: In the snapshot tab of the volume's details panel, click "Delete" item button in the operation dropdown menu to delete a snapshot
* **Restore volume**: In the snapshot tab of the volume's details panel,click "Restore" item button in the operation dropdown menu to restore a snapshot to volume

