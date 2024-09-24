---
title: Subnet Management
description: This chapter introduces how to manage subnets in ChimeStack
weight: 6
---

## Check subnet
  * Click "**Filter**" button, input or select filter conditions, check the filtered subnet list.
  * Click "**Columns**" button, select the columns to be displayed in the list, by default it shows all columns
  
{{% imgproc subnet_list Fit "1000x600" %}}
subnet list 
{{% /imgproc %}}

## Create new subnet
  * Input the name of the subnet, which is restricted to 2～64 characters and only allows alphbet, number, “-” and “_”.
  * Choose a network which the subnet belongs to
  * Input the CIDR
  * (Optional) Input the gateway of the subnet（if omit, it will use the first IP address from the CIDR's IP range as the gateway）
  * Input the reserved IP addresses, use commas to separate multiple addresses，and you can input IP ranges, such as 192.168.231.101-192.168.231.200
  * (Optional) Input description
  
{{% imgproc subnet_new Fit "1000x600" %}}
create subnet
{{% /imgproc %}}

## Subnet management 
  * Click "**Edit**" item button in the operation dropdown menu to update a subnet's properties
  * Click "**Delete**" item button in the operation dropdown menu to delete a subnet
