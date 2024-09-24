---
title: Instance Specification Management
description: This chapter introduces how to manage instance specifications in ChimeStack
weight: 7
---

## Check instance specification 
  * Click "**Filter**" button, input or select filter conditions, check the filtered instance specification list
  * Click "**Columns**" button，select the columns to be displayed in the list，by default it shows all columns
  
{{% imgproc instancespec_list Fit "1000x600" %}}
instance specification list
{{% /imgproc %}}

## Create new instance specification
  * Input the name of the instance specification, which is restricted to 2～64 characters and only allows alphbet, number, “-” and “_”.
  * Choose a type of the instance specification
    * Shared: virtual machines share the physical resources, with this type, resources are utilized more efficiently but may cause resources conflict when the physical resources are running out
    * Dedicated: each virtual machine monoplizes its physical resource
  * Input the number of the vCPUs
  * Input the number of memory (MiB)
  * (Optional) Input Description
  
{{% imgproc instancespec_new Fit "1000x600" %}}
create new instance specification
{{% /imgproc %}}

## Instance specification management 
  * Click "**Edit**" item button in the operation dropdown menu to update an instance specification's properties
  * Click "**Delete**" item button in the operation dropdown menu to delete an instance specification.


## Attach instance specification to cluster
To have the instance specification available in a cluster, administator must attach it to the cluster before creating virtual machines with this instance specification. You can click the "**Attach to Cluster**" item button in the operation dropdown menu to attach it to a cluster, one instance specification can be attached to multiple clusters.
  
{{% imgproc instancespec_relation Fit "1000x600" %}}
Attach instance specifications to clusters
{{% /imgproc %}}

