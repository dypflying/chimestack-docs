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

- When chime-agent starts, it will actively request the status of all undeleted virtual machines of the current computing node and the status of the current computing node from chime-server, and save them in the memory of the chime-agent program. Once the status of the virtual machine changes, such as shutdown, deletion, startup, etc., chime-agent will also update the memory database synchronously.
- When chime-agent is running, it will check whether the running status of the virtual machine instance (qemu-kvm process) of its running node is consistent with the status in the current memory database every 30 seconds. For example, it is found that a certain qemu-kvm process exits abnormally. , chime-agent will automatically start the qemu-kvm process.
- When chime-agent is running, it will report its own heartbeat information every 10 seconds. If chime-server does not receive the heartbeat information of a certain chime-agent within three heartbeat cycles, it will ping the chime-agent back. If it is determined If chime-agent is unreachable, the node will be marked as unreachable. In this state, new virtual machines will not be scheduled to this node, and the virtual machines currently on this node will no longer receive control commands and issue Alarm information. If the chime-agent reports the heartbeat successfully, the status of the node will be marked as "running" again, and the management and control instructions will return to normal.
- The life cycle of the chime-agent process is managed by Linux systemd. As long as the system starts the chime-agent process, it will be pulled up. If the chime-agent process exits abnormally, it will also be automatically pulled up.

## 异常场景时高可用架构的工作机制

##### Scenario#1 computing node down

Computing node failures include power outages caused by serious failures in hardware such as power supply, CPU, memory, hard disk, etc.

According to the implementation of chime-agent, if the computing node is powered off, chime-server will no longer continue to receive heartbeat information from chime-agent. After 3 heartbeat cycles without client information, the computing node will be marked as unreachable. . After the computing node is restarted, chime-agent will first pull the management status of this node and the status of the node's virtual machine:
- If the management status of the node is "unreadable" or "run", the heartbeat will be reported normally and then returned to the normal state. At the same time, the instance of the node's virtual machine will be checked and updated based on the status of the virtual machine.
- If the status of the node is "Down", that is, the administrator has kicked the node out of the cluster on the management side, chime-agent will stop the virtual machine of the node and will no longer receive all commands about the virtual machine from the management side.

In the event of server power outage, the customer's virtual machine can be automatically pulled up, but the restart of the virtual machine can be perceived by the customer.

###### Scenario#2 network failure

Network failures include network equipment such as switches, network cables, or server network cards, as well as network unreachability caused by software reasons.

- The management network is unavailable, but the business network is available: chime-server cannot receive the heartbeat information of chime-agent, and will only mark the node as "unreachable". The network/hardware failure can only be manually confirmed by administrators/operation and maintenance personnel, and then To implement the operation, you can use the operation and maintenance command "chime-agent migrate --interface <interface name> --uuid <vm uuid> --dest <dest ip>", where interface name is the business network port and dest is the business network target. Address, manually migrate the virtual machine of the current node of the virtual machine to other nodes through the business network, and finally mark the node as "Down" state. In this case, the customer is unaware of the migration operation and the virtual machine runs normally.
- The management network is available and the business network is unavailable: chime-agent will detect the status of the business network every 30 seconds. If there is a problem with the business network, chime-agent will mark the computing node status as "error" when reporting heartbeats to chime-server. You can use the operation and maintenance command "chime-agent migrate --interface <interface name> --uuid <vm uuid> --dest <dest ip>", where interface name is the management network port and dest is the management network target address. The business network manually migrates the virtual machine of the current node to another node, and finally marks the node as "Down". In this case, because the business network is interrupted, the customer's access to the virtual machine is interrupted, and the single virtual machine runs normally.
- Both the management network and the business network are unavailable: At this time, the status on the management node side should be "unreachable" and the status on the computing node side should be "error". Since both the management network and the business network are unreachable, the migration action cannot be completed. Operation and maintenance personnel can follow the operation and maintenance manual, or wait for the network to be repaired; or manually clear all virtual machine instances, such as running the "chime-agent drain" command, and then re-establish new virtual machine instances on other nodes. In this case, the customer's access to the virtual machine is interrupted and the virtual machine needs to be restarted.
  
###### Scenario#3 chime-agent process failure

chime-agent进程出现严重异常时，chime-agent进程会异常退出。chime-agent进程的生命周期由systemctl命令管控，并且设置了进城自动拉起，所以chime-agent掉线时，会被系统进程自动地拉起，即可以看作chime-agent进程和计算节点生命周期一致。

###### Scenario#4 其它非严重硬件故障

有时候，硬件的故障并不会导致服务器关机，或者网络不可达这样的可以直接察觉的严重故障。有些硬件故障比如磁盘故障导致的I/O异常、网络设备故障导致的丢包等，程序并不会直接修改计算节点的状态。针对这种故障，ChimeStack提供了完善的监控机制来发现各种硬件设备的异常数据，比如网口丢包等，运维人员根据监控报警信息，人工确认后再手动执行运维操作，比如建议，标记"Down"等。 