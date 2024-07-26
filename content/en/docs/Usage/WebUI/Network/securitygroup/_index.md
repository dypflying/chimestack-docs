---
title: Security Group
description: This chapter introduces how to manage security groups
weight: 3
---

## Check Security Groups

* Check security group list:
  * Click "**filter**" button, input or select filter conditions, check the filtered security group list
  * Click "**columns**" button，select the columns to be displayed in the list，by default it shows all columns
* To view a security group's details, select the security group in the list，detailed information will be showed in the below panel.
  * General information tab: show the general information of the security group.
  * Ingress rules tab: show the ingress rules of the security group.
  * Engress rules tab: show the engress rules of the security group.
  * Operation logs tab: Show the security group's operation logs
  
{{% imgproc sg_list Fit "1000x600" %}}
security group's list page
{{% /imgproc %}}

{{% imgproc sg_ingress Fit "1000x400" %}}
security group's ingress rules
{{% /imgproc %}}

{{% imgproc sg_egress Fit "1000x400" %}}
security group's egress rules
{{% /imgproc %}}

{{% imgproc sg_log Fit "1000x400" %}}
security group's operation logs
{{% /imgproc %}}

## Create Security Group
* Input basic information:
  * Input name of the security group, it is restricted to 2～64 characters
  * (Optional) input description

{{% imgproc sg_new_basic Fit "1000x400" %}}
create new security group
{{% /imgproc %}}

* Input ingress rules:
  * Action policy(ACCEPT or REJECT)
  * Protocol(tcp, udp, icmp)
  * Source address's CIDR(default is 0.0.0.0/0, which stands for all IPs)
  * Destination port or port range(it can be a port number or a port range, e.g. "1000:2000" stands for the ports from 1000 to 2000)
  * (Optional) input description

{{% imgproc sg_new_ingress Fit "1000x400" %}}
input security group's ingress rules
{{% /imgproc %}}

{{% alert title="Information" color="primary" %}}
   1. The order of the rules is essential because network packs will be matched per the rules in order.
   2. One security group can have up to 128 ingress rules.
   3. The ingress rules of the security group already embed the following rules by default, which do not need to be added manually:
      1. Accept the packs from established connections
      2. Accept the packs from dhcp server
      3. Drop all packs (always be the last one of all rules)
{{% /alert %}}

* Input egress rules:
  * Action policy(ACCEPT or REJECT)
  * Protocol(tcp, udp, icmp)
  * Destination address's CIDR(default is 0.0.0.0/0, which stands for all IPs)
  * Destination port or port range(it can be a port number or a port range, e.g. "1000:2000" stands for the ports from 1000 to 2000)
  * (Optional) input description

{{% imgproc sg_new_egress Fit "1000x400" %}}
input security group's egress rules
{{% /imgproc %}}

{{% alert title="Information" color="primary" %}}
   1. The order of the rules is essential because network packs will be matched per the rules in order.
   2. One security group can have up to 128 egress rules.
   3. The egress rules of the security group already embed the following rules by default, which do not need to be added manually:
      1. Accept the packs from dhcp client
      2. Drop the packs from dhcp server
      3. Accept the packs from established connections
      4. Drop all invalid packs (always be the last one of all rules)
{{% /alert %}}

### Update Security Group's Information

On Web UI, the operation of updating a security group is quite similar to the operation of creating a new security group. But after the security group is updated, all elastic interfaces bound to the security group will be updated as well, that is, a synchronization task will be triggered to update the rules of "iptables" on nodes.

## Network Interface's Lifecycle Management 
* **Delete**: You can delete the security groups which are in "Available" state by clicking the "Delete" item button in the operation list. Note: Deleted interfaces can not be restored. **Note**: If the security group has been bound to any elastic interfaces, it cannot be deleted directly. You need to release them before deleting the security group.