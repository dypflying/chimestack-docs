---
title: Storage Pool Management
description: This chapter introduces how to manage storage pools in ChimeStack
weight: 8
---

## Check storage pools
  * Click "**Filter**" button, input or select filter conditions, check the filtered storage pool list.
  * Click "**Columns**" button, select the columns to be displayed in the list, by default it shows all columns

{{% imgproc pool_list Fit "1000x600" %}}
storage pool list
{{% /imgproc %}}

## Create new storage pool
  * Input the name of the storage pool 
  * Choose the type of the storage pool
    * Local Storage: the local persistent disks in the computing nodes
    * Ceph storage: Ceph's storage pool
  * (Only for local storage) Input the backend path, which is for storing volumes' data, it must be an existing directory in all the nodes of the cluster. 
  * (Only for local storage) Input the image cache path, which is for storing the image caches, it must be an existing directory in all the nodes of the cluster. 
  * Input the size ratio, which multiplies the physical size as the allocatable size of the storage pool.
  * (Only for Ceph storage) Ceph Monitor's address
  * (Only for Ceph storage) Ceph Monitor's port
  * (Only for Ceph storage) Ceph's storage pool name
  * (Only for Ceph storage) Ceph's access username
  * (Only for Ceph storage) Ceph's access key
  * Input the physical size(GiB)
  * Input the reserved size(GiB), which is not allocatable to virtual volumes. 
  * (Optional) Input description
{{% imgproc pool_new Fit "1000x600" %}}
create storage pool (local)
{{% /imgproc %}}

{{% imgproc pool_new_ceph Fit "1000x600" %}}
create storage pool (ceph)
{{% /imgproc %}}

## Storage pool management
  * Click "**Edit**" item button in the operation dropdown menu to edit a storage pool's properties.
  * Click "**Delete**" item button in the operation dropdown menu to delete a storage pool