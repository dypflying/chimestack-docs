---
title: 3.6 Solutions for Node Failures
weight: 6
description: This chapter introduces the solutions for handling node failures
---

## Overview

When a node is abnormal due to hardware or software issues or needs a shutdown for maintenance, to keep the availability of the virtualization services, such as virtual machine instances, virtual cloud disks, etc. which are running on the node have to be migrated to other functioning nodes. As shown below: 

![node failover](/images/chime-agent-ha.png)

The operation methods for a node's failover include:

* **Migration**: Migrate all virtual machines on the failure node to other nodes without the user's awareness, of scenarios:
  - Live migrate virtual machines when the node is abnormal but not down
  - Live migrate virtual machines when the node needs a shutdown for maintenance
* **Drain**: stop all the virtual machines on a node, of scenarios:
  - To prevent "brain split", stop all the virtual machines on this node before rebuilding them on other nodes.
  - To shutdown the node for any reasons.
* **Rebuild**: Rebuild the same virtual machine instances on other nodes, of scenarios:
  - Migrate the virtual machines on the failure node to other nodes when the node is down.

Following is the introduction to the 3 operational methods.

## Node Mingration

The node migration is to migrate the virtual machine instances from one physical node to other nodes through libvirt, while the instance user is not aware of the migration process.
A migration process can be triggered through the control plane(Web UI or chimecli). Although the chime-agent can also trigger it, it is not recommended since triggering migration by chime-agent is only for the case that the control plane cannot connect the node normally, and it can not update the metadata of the resources related to the migration in real-time.   
However for the node migration process, if it is triggered by the chime-agent's command line, the data transmission of the migration can use either one of the established networks. That is, you can choose either the management network, node network, or storage network (if any) for transmitting the data. But if the migration task is triggered by the chime-server or chimecli, the migration data can only be transmitted through the "management network".

### Trigger migration on Web UI

Choose the node to be migrated from the node list on the "**Registered Host Management**" page, click the "**Migrate**" button in the "**Operation**" menu, pop up the migration options page as following.

{{% imgproc node_migrate Fit "700x400" %}}
node migration
{{% /imgproc %}}

Fill the following options then begin the migration:

- **Target Host**: You can select a target node, so all the virtual machines on the source node will be migrated to the target node, but it will fail if the physical resources (CPU, memory, storage) of the target node are not enough to accommodate them. Or you can leave the option unselected, the system will schedule the virtual machines to the most suitable nodes in the cluster according to their physical resource consumption data.
- **Migrate VMs With Local Disks**: If this option is selected, even if the virtual machine contains local disks, it will be migrated as well. **Note**, migrating a virtual machine with local disks will consume plenty of network bandwidth and physical CPU resources, also it takes a much longer time to finish, depending on the amount of data written in the local disks, because the migration process will not only copy the memory but also copy the disks' data. This option is not selected by default, if leave the option unselected, the virtual machines with local disks will not be migrated.

During the migration is ongoing, the node's state machine is locked, and the node's information will be updated after the migration is completed (such as, the number of virtual machines on the node, the final status of the migration task, etc.).


### Trigger migration via chimecli

Command Usage:

```
 chimecli host migrateHost [flags]

Flags:
      --AzUuid string                              Required. the AZ's uuid
      --Body string                                Optional json string for [Body]. the http post body
      --ClusterUuid string                         Required. the cluster's uuid
      --HostUuid string                            Required. the host's uuid
  -h, --help                                       help for migrateHost
      --migrateHostRequest.MigrateLocalDiskVms     whether to migrate the virtual machines with local disks (default is false)
      --migrateHostRequest.TargetHostUuid string   the target host's uuid, system will automatically assign one host if omit
```

Argument Description：
- **migrateHostRequest.MigrateLocalDiskVms**: (optional) migrate the virtual machines with local disks
- **migrateHostRequest.TargetHostUuid**: (optional) target node's Uuid

Example:

```
   chimecli host migrateHost \
      --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
      --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
      --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a \
      --migrateHostRequest.MigrateLocalDiskVms \
      --migrateHostRequest.TargetHostUuid 12345678-1112-449d-8d3e-3ff8b1323d9e 

```

### Migrate via chime-agent's command line

{{% alert title="Information" color="primary" %}}
Unlike the node migration triggered by the control plane components, migrating via chime-agent must specify a network for transmitting data and a target node for accommodating virtual machines.
{{% /alert %}}

Command Usage:

```
  chime-agent migrate 

Flags:
  --interface <interface name>
  --dest <target ip>
  --vm_uuid [vm uuid]
  --all 
  --confirm 
```

Argument Description:

- **interface**: Specify the network interface name for transmitting data
- **dest**: Specify the target node's IP address
- **vm_uuid**: (Optional) Specify the UUID of a single virtual machine to be migrated only, this option must be chosen if the "--all" option omits. 
- **all**: Migrate all the virtual machines on the node, this option must be chosen if the "--vm_uuid" option omits. 
- **confirm**: Specify this option to trigger a real migration, otherwise, it acts as a "dry-run" which only checks the parameters and migrating conditions.

Example:

```
  chime-agent migrate \
  --interface eth1 \
  --dest 10.10.10.3 \
  --all \
  --confirm 
```

## Node Drain

The node drain function shuts down all virtual machines on the node and marks the node as "drained" state, a drained node will not be scheduled with any new virtual machine. 
Besides this feature is convenient to shut down the virtual machines on the node in parallel, this feature is more essentially designed for mitigating the services' downtime in case of serious node failures. For example, when a node crashes due to some hardware failure or something else, if this failure can't be restored in a short period, the virtual machines on the node must be migrated to other nodes. However, because the node is down, the standard migration can't be performed through libvirt, the virtual machines have to be rebuilt on other nodes as a secondary failover method. After the rebuilding process finishes, it is important to make sure that the virtual machines on the source node will no longer be active, otherwise, it will cause the "brain split" problem. Therefore, it is necessary to trigger a "drain" process on the source node before triggering the "rebuild" process on the other nodes. With the "drain" and "rebuild" operations, it ensures the uniqueness of a single virtual machine instance at any time.

### Trigger a drain on Web UI

Choose the node to be drained from the node list on the "**Registered Host Management**" page, click the "**Drain**" button in the "**Operation**" menu, then click the "**Confirm**" button to start. 
During the draining process is ongoing, the node's state machine is locked, and the node's information will be updated after the process is completed (such as, the number of virtual machines on the node, the final status of the draining task, etc.).

{{% imgproc node_drain Fit "480x350" %}}
drain a node
{{% /imgproc %}}


### Drain via chimecli tool

Command Usage:

```
  chimecli host drainHost [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --HostUuid string      Required. the host's uuid
```

Example:

```
   chimecli host drainHost \
      --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
      --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
      --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a 

```

### Drain via chime-agent's commnad line 

Command Usage:

```
  chime-agent drain 

Flags:
  --confirm 
```

Argument Description:

- **confirm**: Specify this option to trigger a real draining process, otherwise, it acts as a "dry-run" which only checks the parameters and draining conditions.

Example:

```
  chime-agent drain --confirm 
```

## Node Rebuild

According to the above descriptions for the "Drain Node" and "Rebuild Node" processes, it is an operational method to restore the virtual machine services in case of their physical server is down. In short, a node rebuilding process is to recreate all the virtual machines of the down node on other normal functioning nodes. However, the following points require attention:

1. The virtual machines with local disks on the failed node will not be rebuilt during the "rebuilding" process, because the data on the local disk of the failed node cannot be copied. Therefore, the reliability of virtual machines using local disks is heavily limited by the reliability of the physical node. 
2. Rebuild prcess can only be triggered from the control plane(Web Ui or chimecli), can not be triggered from the chime-agent.
3. Only nodes in the "drained" state can perform the rebuild operation.

### Trigger a rebuilding process on Web UI

Choose the node to be drained from the node list on the "**Registered Host Management**" page, click the "**Rebuild**" button in the "**Operation**" menu, then click the "**Confirm**" button to start. 
During the rebuilding process is ongoing, the node's state machine is locked, and the node's information will be updated after the process is completed (such as, the number of virtual machines on the node, the final status of the rebuilding task, etc.).

{{% imgproc node_rebuild Fit "900x300" %}}
node rebuild
{{% /imgproc %}}

### Trigger rebuild via chimecli's command line

Command Usage:

```
  chimecli host rebuildHost [flags]

Flags:
      --AzUuid string                              Required. the AZ's uuid
      --Body string                                Optional json string for [Body]. the http post body
      --ClusterUuid string                         Required. the cluster's uuid
      --HostUuid string                            Required. the host's uuid
      --rebuildHostRequest.TargetHostUuid string   the target host's uuid, system will automatically assign one host if omit
```

Argument Description:
- **rebuildHostRequest.TargetHostUuid**: (optional) Target host's Uuid

Example:

```
   chimecli host rebuildHost \
      --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
      --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
      --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a \
      --migrateHostRequest.TargetHostUuid 12345678-1112-449d-8d3e-3ff8b1323d9e 
```