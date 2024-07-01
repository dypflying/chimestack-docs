---
title: Agent HA Settings
date: 2023-11-09
weight: 3
---

{{% alert title="Information" color="default" %}}
本章节仅介绍chime-agent如何和chime-server一起工作来实现虚拟机资源的高可用，没有涉及到部署配置的内容，如果您正在部署生产环境，可选择性地忽略本章。
{{% /alert %}}

## Introduction to chime-agent's HA 

chime-agent is a unique daemon process running in the computing node, it receives the commands from the chime-server and handles the virtual resources in the node correspondingly, the chime-agent process is controlled by the Linux’s systemd, so we can approximately consider it as the same lifecycle with a computing node. So implementing the chime-agent’s HA as well as the computing nodes is one of the key aspects of the whole ChimeStack’s HA.
ChimeStack ensures a virtual machine instance(a qemu-kvm process indeed) is a unique instance among all computing nodes and the instance’s SLA must not be less than 99.9%. The HA for the chime-agent’s requires the following 3 aspects:
- High availability of virtual machine processes (SLA 99.9%)
- Uniqueness of a virtual machine's process
- Controllableness of a virtual machine's process
  
### The HA theory in ChimeStack

The architecture of ChimeStack is a distributed system with a central management and control framework, that is, the management service program (chime-server) controls the full lifecycle of the virtual machines. The state of each virtual machine is saved in the central database,  the chime-agent receives the commands from the chime-server. The server controls the virtual machine’s lifecycle, and the chime-agent reports its heartbeats to the chime-server and pulls the metadata of virtual machines that are on the node. The following figure is a schematic diagram of the virtual machines' high availability.


![TO-DO](/images/chime-agent-ha.png)

- When the chime-agent starts, it will continuously retrieve the state of all virtual machines on its native node from the chime-server, and keep them in the in-memory database of the program. Once the state of any of the virtual machines changes, such as a shutdown, a deletion, a start, etc., the chime-agent updates its in-memory database synchronously.
- When the chime-agent is running, it will intermittently check whether the state of the virtual machine instances (qemu-kvm processes) is consistent with the status of the in-memory database. For example, if it is found that a qemu-kvm process exits abnormally. chime-agent automatically starts the qemu-kvm process.
- When the chime-agent is running, it will report its heartbeat status every 15 seconds. If the chime-server does not receive the heartbeat status for three heartbeat periods, it will try to ping the chime-agent back. If it is determined that the chime-agent is unreachable, the node will be marked as an "unreachable" node. In this state, new virtual machines will not be scheduled for this node anymore. If the chime-agent reports the heartbeat successfully again, the chime-server will mark the computing node as "running" again, and all the management of the node will resume normally.
- The lifecycle of the chime-agent process is managed by the Linux systemd. In case of the chime-agent process exits abnormally, the systemd will continuously try to pull it up.

### Node status introduction

The status of a node can be categorized into two types: "management status" and "monitor status". The following describes the two states respectively.

**Management State**: The state machine of a node for management including: 
- Enabled: The normal state, new virtual machines can be scheduled on the node, and the life cycle of the virtual machines on the node is managed normally by the control plane.
- Disabled: New virtual machines will not be scheduled to this node, but the lifecycle of existing virtual machines on this node is managed normally by the control plane.
- Drained: No new virtual machines will be scheduled to the node, and all virtual machines on the node are stopped, that is, no virtual machine instances on the node is active.

**Monitor State**: 
- Normal: Receives heartbeats from chime-agent normally 
- Unreachable: The chime-agent does not report heartbeats, and the chime-server fails to ping the chime-agent. In this case, an alarm is issued and new virtual machines will not be scheduled to the node.
- Error: The chime-agent detects that the node is something abnormal, but the heartbeats can be reported normally.

### Virtual machine's HA Solution

To ensure the high availability of virtual machines, in case of a node failure due to its software or hardware, some operational methods can be taken for the node's failover or mitigating the downtime, for instance:

1. **Live migration**: When a node fails or needs a shutdown for maintenance, you can migrate the virtual machines on the node to other nodes without the user's awareness. More information refer to [Solutions For Node failures](/en/docs/usage/failure)
2. **Drain + Rebuild**: When a node fails, you can migrate the virtual machines on the node to other nodes by "draining" them on the current node and then "rebuilding" them on the other functioning node. More information refer to [Solutions For Node failures](/en/docs/usage/failure)


## The working mechanisms of the HA architecture for failures

##### Scenario#1 computing node down

Computing node failures include power outages caused by hardwares such as failures of power supply, CPU, memory, hard disk, etc.

According to the implementation of chime-agent, if the computing node is powered off, chime-server will no longer continue to receive heartbeat information from chime-agent. After 3 heartbeat periods without receiving client information, the computing node will be marked as unreachable. After the computing node is restarted, chime-agent will first pull the status of this node and the status of the node's virtual machines:
- If the management status of the node is "unreadable" or "running", the heartbeat will be reported normally and then returned to the normal state. At the same time, the instance of the node's virtual machine will be checked and updated based on the status of the virtual machine.
- If the status of the node is "Down", that is, the administrator has kicked the node out of the cluster on the management side, chime-agent will stop the virtual machines on the node.

In the event of server power outage, the customer's virtual machine can be automatically pulled up, but the restart of the virtual machine can be perceived by the customer.

###### Scenario#2 network failure

Network failures include network equipment such as switches, network cables, or server network cards, as well as network unreachability caused by software reasons.

- The management network is unavailable, but the business network is available: chime-server can not receive the heartbeat of chime-agent, and will mark the node as "unreachable". The network/hardware failure can only be manually confirmed by administrators/SRE, who can invoke the maintenance command "chime-agent migrate --interface <interface name> --uuid <vm uuid> --dest <dest ip>", where interface name is the business network's interface and the destination is the business network target address, manually migrate the virtual machine of the current node of the virtual machine to other nodes through the business network, and finally mark the node as "Down" state. In this case, the migrating virtual machine is running with any interruption. 
- The management network is available and the business network is unavailable: chime-agent will detect the status of the business network every 30 seconds. If there is a faulure of the business network, chime-agent will mark the computing node as "error" when reporting heartbeats to chime-server. You can invoke the maintenance command "chime-agent migrate --interface <interface name> --uuid <vm uuid> --dest <dest ip>", where interface name is the management network porinterface and destination is the management network target address. The business network manually migrates the virtual machine to another node, and marks the node as "Down". In this case, because the business network is interrupted, the customer's access to the virtual machine is interrupted, but the virtual machine is running normally as well as its processes.
- Both the management network and the business network are unavailable: At this time, the status on the management node side should be "unreachable" and the status on the computing node side should be "error". Since both the management network and the business network are unreachable, the migration action cannot be completed. SRE can follow the operation and maintenance manual, or wait for the network to be recovered; or manually clear all virtual machine instances, such as invoking the "chime-agent drain" command, and then re-establish new virtual machine instances on other nodes. In this case, the customer's access to the virtual machine is interrupted and the virtual machine has to be restarted.
  
###### Scenario#3 chime-agent process failure

When chime-agent downs, it will be automatically pulled up by the systemd, so we can assume that the computing node must be something wrong if the chime-agent process can not be pulled up.

###### Scenario#4 other hardware failures

Sometimes, hardware failure does not cause the server to shutdown, or cause the network to be unreachable. For some hardware failures, such as I/O errors caused by some disk failure, network package losses caused by some network device's intermittent failures, etc., chime-server will not change the status of the computing node automatically. For this sort of failures, ChimeStack provides a sophisticated monitoring mechanism to detect abnormal data of various hardware devices, such as network package loss, etc. SRE can make operations based on the alarms' information and manual checks for the system. 