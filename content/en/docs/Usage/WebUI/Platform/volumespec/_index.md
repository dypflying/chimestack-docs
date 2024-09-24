---
title: Volume Specification Management
description: This chapter introduces how to manage volume specifications in ChimeStack
weight: 9
---

## Check volume specifications 
  * Click "**Filter**" button, input or select filter conditions, check the filtered volume specification list
  * Click "**Columns**" button，select the columns to be displayed in the list，by default it shows all columns
  
{{% imgproc volumespec_list Fit "1000x600" %}}
volume specification list 
{{% /imgproc %}}

## Create new volume specification
  * Input the name of the volume specification, which is restricted to 2～64 characters and only allows alphbet, number, "-" and "_".
  * Choose a storage pool 
  * Input the minimum IOPS of the volume specification
  * Input the maximum IOPS of the volume specification
  * Input the step IOPS of the volume specification
  * Input the minimum throughput of the volume specification
  * Input the maximum throughput of the volume specification
  * Input the step throughput of the volume specification
  * (Optional) Input description

{{% pageinfo color="primary" %}}

The formula for calculating a volume's IOPS limitation: 
```
a volume's IOPS = MAX('minimum IOPS', MIN('maximum IOPS', size(GiB)*'step IOPS'))
```

The formula for calculating a volume's throughput limitation: 
```
a volume's throughput = MAX('minimum throughput', MIN('maximum throughput', size(GiB)*'step throughput'))
```
{{% /pageinfo %}}

{{% imgproc volumespec_new Fit "1000x600" %}}
create new volume specification
{{% /imgproc %}}

## Volume specification management 
  * Click "**Edit**" item button in the operation dropdown menu to update a volume specification's properties
  * Click "**Delete**" item button in the operation dropdown menu to delete a volume specification.

## Attach volume specification to a cluster 
To have the volume specification available in a cluster, administator must attach it to the cluster before creating virtual volumes with this specification. You can click the "**Attach to Cluster**" item button in the operation dropdown menu to attach it to a cluster, one volume specification can be attached to multiple clusters.

{{% imgproc volumespec_relation Fit "1000x600" %}}
Attach volume specifications to clusters
{{% /imgproc %}}
