---
title: Agent HA Settings
date: 2023-11-09
weight: 3
---

{{% alert title="Information" color="default" %}}
This chapter only introduces how the chime-agent works with the chime-server to achieve high availability of virtual machines. It does not involve any deployment configuration. If you are deploying a production environment, you can optionally ignore this chapter.
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

## Solutions for node failures 


#### Scenario #1: Computing node's down failure

Computing node-down failures include power outages caused by serious hardware issues, such as problems with power supplies, CPUs, memory, and hard disks. In case of a down failure such as a server power outage, the virtual machines running on the node will also go down. We do need some operations at this time to mitigate the downtime of the affected virtual machines.

Since the chime-server will no longer receive the heartbeat of the node, the monitor state of the node will be marked as "unreachable" within 1 minute from the down failure. An "unreachable" node will not allow new virtual machines to be scheduled on it, alarm messages will be issued to alarm receivers.
After checking the node manually, the administrator/SRE can choose the following operations to solve the problem according to its fault situations: 

- If the node can be recovered in a short period, when the node is recovered and online again, the chime-agent will automatically pull the state information of all virtual machines on the node from the chime-server during its startup process, and start the virtual machines whose management state are "running" automatically. At the same time, the chime-agent will resume reporting heartbeats, chime-server will mark the node's monitor state as "normal" again.
- If the node cannot be recovered in a short period, the administrator/SRE can "drain" the node. By doing this, even if the node is recovered online, the virtual machines on the node won't get started. To migrate the virtual machines on a "drained" node, the administrator/SRE can "rebuild" the node, which means, the virtual machines on the node will be recreated on other nodes during the rebuilding process. If the "rebuild" task finishes successfully, the virtual machines of the source node will be deleted automatically after the node as well as its chime-agent is recovered online again. The purpose of the "drain" + "rebuild" operations is to ensure that there is one and only one virtual machine running at any time to avoid the "brain split" issue.
  

#### Scenario #2: The chime-agent process exits abnormally

The life cycle of the chime-agent process is controlled by the "systemd" service, which will pull up the chime-agent process automatically when it exits due to any reason. So we can consider that the life cycle of the chime-agent process is consistent with its node.

#### Scenario #3: Computing node's non-critical failure

Most of the time, some hardware or software failures will not directly lead to server down failures, such as I/O errors caused by disk failures, packet loss caused by network transmission failures, etc. Chime-agent has implemented some monitors to detect couples of hardware/software issues, and chime-agent can report these issues as well as its heartbeat information to the chime-server, when chime-server receives these abnormalities of the node, it will mark the node's monitor state as "error" according to the type of failures and issues alarms. In this case, the SRE/administrator needs to manually confirm the alarm information and then perform some actions, such as to initiate a "migration", or to initiate a combined operation of "drain" and "rebuild".


#### Scenario #4: Node's management network is down, the business network is up

In this case, the chime-server can't receive the heartbeat information of the node, nor does it control the node through the management network, So the chime-server will mark the node's monitor state as "unreachable". Administrator/SRE can manually confirm the network/hardware failures and then perform some operation with the chime-agent's command line, for example: 

```
#migrate single virtual machine 
chime-agent migrate --interface <interface name> --uuid <vm uuid> --dest <dest ip>
```

or 

```
#migrate all virtual machines on the node 
chime-agent migrate --interface <interface name> --all --dest <dest ip>
```

The chime-agent's command line enables us to migrate the virtual machines through the business network or storage network(if any) when the management network is down. You can just specify the interface name and target node's IP address of the business network(or storage network). **Note**: Do not migrate VM instances directly through libvirt or qemu, as this will lead to inconsistent states between chime-server and chime-agent. After migrating successfully with the chine-agent, if the target node is functioning normally, it will report the migration incidence to the chime-server with a heartbeat reporter, the chime-server will automatically update the virtual machines' meta information on the control plan, and it will not cause inconsistent states.

#### Scenario #5: Node's management network is up, the business network is down

Chime-agent monitors the business network by checking its connectivity every 30 seconds, if there is a problem with the business network, chime-agent will report the problem with the heartbeat report to the chime-server and mark the current node as in "error" state. 
Since the management network is normal, you can either "migrate" the node or "drain" + "rebuild" the node by the control plane and naturally use the management network for data transmission. **Note**: In this case, since the business network is down, the user can not access the virtual machines on the problematical node while they are running until the migration is done

#### Scenario #6: Node's management network and business network are both down

At this time, the monitor state of the node is marked as "unreachable". Since both the management network and the business network are down, we can not migrate the virtual machines through the management network or the business network, and the control plane(chime-server) is not able to reach the node either. In this case, you need to login to the node's terminal and execute the command as following:

```
chime-agent drain 
```

to manually drain all the virtual machines on the node, then "drain" the node again via the chime-server to keep the node's state consistent between the chime-server and chime-agent, and then you can invoke a "rebuild" task to have the virtual machines recreated on other nodes.
