---
title: Layer-2 Network Management
description: This chapter introduces how to manage layer-2 networks in ChimeStack
weight: 5
---

* Check layer-2 network list
  * Click "**Filter**" button, input or select filter conditions, check the filtered layer-2 network list
  * Click "**Columns**" button，select the columns to be displayed in the list，by default it shows all columns

{{% imgproc network_list Fit "1000x600" %}}
layer-2 network list page
{{% /imgproc %}}

* Create new layer-2 network
  * Input the name of the network
  * Choose the type of the layer-2 network from "classical network", "VLAN network" and "VxLan network", but current version of ChimeStack only support the "classical network", while the other two types of network are coming soon.
  * Input the network bridge name
  * Input the network interface's name, which has been regularized before as a unique network interface name for all the nodes in the cluster.
  * (Optional) Input description
{{% alert title="Warning" color="warning" %}}
Note: The network interface's name must be the real and unique network interface name in all the nodes in the cluster. If not, please refer to the [Network Interface Bonding](/en/docs/reference/other/bond) for details about how to regularize the network interface name.
{{% /alert %}}

{{% imgproc network_new Fit "1000x600" %}}
create new layer-2 network
{{% /imgproc %}}

* Layer-2 network management
  * Click "**Edit**" item button in the operation dropdown menu to update the network's properties
  * Click "**Delete**" item button in the operation dropdown menu to delete a network
  * Click "**Subnet Management**" item button in the operation dropdown menu to jump to the subnet management page
