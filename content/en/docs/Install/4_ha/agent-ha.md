---
title: Agent HA Settings
date: 2023-11-09
weight: 3
---

## Introduction to chime-agent's HA 

chime-agent is a unique deamon process running in the computing node, it receives the commands from the chime-server and handles the virtual resources in the node correspondingly, the chime-agent process is controlled by the linux's systemd, so we can approximately consider it as the same lifecycle with a computing node. So implementing the chime-agent's HA as well as the computing nodes is one of the key aspects of the whole ChimeStack's HA.  
ChimeStack ensures a virtual machine instance(a qemu-kvm process indeed) is a unique instance among all computing nodes and the instance's SLA must not be less than 99.9%. The overall HA of the chime-agent's requirement can be described as the following 3 aspects: 
- HA of a virtual machine's process
- Uniqueness of a virtual machine's process
- Controllableness of a virtual machine's process
  
## Architecture's Theory

The architecture of ChimeStack is basically a distributed system with a central management and control framework, that is, the central management service process (chime-server) controls the full lifecycle of the virtual machines. The status of each virtual machine is saved in the chime-server's database, and the chime-agent receives the commands from chime-server. The server controls the virtual machine's lifecycle, chime-agent reports heartbeats to chime-server, and pulls the meta data of virtual machines which are located in the node. The following figure is a schematic diagram of chime-agent's high availability.


![TO-DO](/images/chime-agent-ha.png)

- When chime-agent starts, it will continuously retrieve the status of all installed virtual machines of the current computing node from chime-server, and keep them in the in-memory database of the program. Once the status of the virtual machine changes, such as a shutdown, a deletion, a startup, etc., chime-agent updates its in-memory database synchronously.
- When chime-agent is running, it will intermittently check whether the status of the virtual machine instances (qemu-kvm processes) are consistent with the status of the in-memory database. For example, if it is found that a qemu-kvm process exits abnormally. chime-agent automatically start the qemu-kvm process.
- When chime-agent is running, it will report its heartbeat status every 10 seconds. If chime-server does not receive the heartbeat status for three heartbeating periods, it will try to ping the chime-agent back. If it is determined that chime-agent is unreachable, the node will be marked as an "unreachable" node. In this state, new virtual machines will not be scheduled to this node any more. If the chime-agent reports the heartbeat successfully again, the chime-server will mark the computing node as "running" again, and all the management of the node will resume normal.
- The lifecycle of the chime-agent process is managed by Linux systemd. In case of the chime-agent process exits abnormally, systemd will continuously try to pull it up.

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