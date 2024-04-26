---
title: agent的高可用介绍
date: 2023-11-09
weight: 3
---

{{% alert title="提示" color="default" %}}
本章节仅介绍chime-agent如何和chime-server一起做到计算资源的高可用，并没有介绍部署配置相关的操作。如果仅需要快速部署生产环境，可先忽略本章。
{{% /alert %}}

## chime-agent 高可用介绍

chime-agent进程作为运行在计算节点程序，它接收chime-server下发的指令并对虚拟机的全生命周期进行管控，所以chime-agent的高可用即计算服务的高可用，是ChimeStack高可用框架中另外重要的一部分。ChimeStack为了保证虚拟机事务的一致性，即对于任一运行的客户虚拟机实例，同一时刻，保证有且仅有一个运行的qemu-kvm进程，并可对其生命周期进行管理控制，简单地说，客户端(计算节点)的高可用可以分成三个要求：
- 虚拟机进程高可用(SLA 99.9%)
- 虚拟机进程的唯一性
- 虚拟机可管控
  
## 架构原理

ChimeStack框架的设计方案主要是中央管控机制，即管控服务进程(chime-server)管理虚拟机的全生命周期，每个虚拟机的状态都会保存在chime-server的数据库中，chime-agent接收chime-server对虚拟机的的管控指令、对chime-server上报心跳、拉取虚拟机信息，下图是chime-agent高可用的示意图： 

![TO-DO](/images/chime-agent-ha.png)

- chime-agent在启动时，会主动向chime-server请求当前计算节点所有未删除的虚拟机的状态以及当前计算节点的状态，并且保存在chime-agent程序的内存中，一旦虚拟机的状态被客户改变，如停机、删除、启动等，chime-agent也会同步更新这个内存数据库。
- chime-agent在运行时，每隔30s就会检查自己运行节点的虚拟机实例(qemu-kvm进程)的运行状态是否和当前内存数据库中的状态保持一致，比如发现某qemu-kvm进程异常退出，chime-agent会自动拉起该qemu-kvm进程。 
- chime-agent在运行时，每隔10s会上报自己的心跳信息，如果chime-server在三个心跳周期没有收到某个chime-agent的心跳信息，会反ping一下该chime-agent，如果确定chime-agent不可达，则会标记为该节点为unreachable状态，在此状态下，不会再调度新虚拟机到这个节点上，且当前在此节点的虚拟机将不再接收管控命令，同时发出报警信息。如果chime-agent上报心跳成功，则会重新把该节点的状态标记为"运行"，管控指令也恢复正常。
- chime-agent进程的生命周期由linux systemd负责管理，只要系统启动chime-agent进程就会被拉起，如果chime-agent进程异常退出后，也会被自动拉起。

## 异常场景时高可用架构的工作机制

##### 场景1 计算节点故障掉电

计算节点故障包括电源、CPU、内存、硬盘等硬件的严重故障导致的掉电。

根据chime-agent的实现，如果计算节点断电，chime-server不会再继续接收chime-agent发出的心跳信息，在3个心跳周期没有客户端的信息后，会把该计算节点标记为unreachable的状态。计算节点重新启动后，chime-agent首先会拉取本节点的管理状态和该节点虚拟机的状态：
- 如果节点的管理状态是"unreadable"或者"run"，则会正常上报心跳，然后恢复到正常状态，同时根据虚拟机的状态检查并更新该节点虚拟机的实例。
- 如果节点的状态是"Down"，即管理员已经在管理端把该节点踢出集群，则chime-agent会将该节点的虚拟机停止，并且不再接收管理端关于虚拟机的所有命令。

针对服务器掉电的故障，客户的虚拟机可以被自动拉起，但虚拟机重启是可以被客户感知到的。

###### 场景2 网络故障

网络故障包括网络设备如交换机、网线，或者服务器网卡，以及软件原因造成的网络不可达。

- 管理网不可用，业务网可用: chime-server接收不到chime-agent的心跳信息，只会将节点标记为"unreachable"，只能由管理员/运维人员人工确认网络/硬件故障，然后实施操作， 可以通过运维命令"chime-agent migrate --interface <interface name> --uuid <vm uuid> --dest <dest ip>"，其中interface name为业务网网口，dest为业务网目标地址，通过业务网手动迁移虚拟机当前节点的虚拟机到其它节点，最后标记该节点为"Down"状态。对于这种情况，客户是对迁移操作无感知的，且虚拟机正常运行。
- 管理网可用、业务网不可用: chime-agent会每30s检测业务网的状态，如果业务网出现问题，chime-agent在向chime-server上报心跳时，会标记计算节点状态为"error"。可以通过运维命令"chime-agent migrate --interface <interface name> --uuid <vm uuid> --dest <dest ip>", 其中interface name为管理网网口，dest为管理网目标地址，通过业务网手动迁移虚拟机当前节点的虚拟机到其它节点，最后标记该节点为"Down"状态。对于这种情况，因为业务网络中断，客户对虚拟机的访问是中断的，单虚拟机正常运行。 
- 管理网、业务网均不可用: 此时，管理节点侧的状态应该是"unreachable",计算节点侧的状态为"error"，由于管理网和业务网都不可达，所以无法完成迁移动作。运维人员可以根据运维手册，或等待修复网络；或人工清除所有虚拟机实例，如运行"chime-agent drain"命令，然后在其它节点重新建立新的虚拟机实例。对于这种情况，客户对虚拟机的访问是中断的，虚拟机需要重新启动。
  
###### 场景3 chime-agent进程异常

chime-agent进程出现严重异常时，chime-agent进程会异常退出。chime-agent进程的生命周期由systemctl命令管控，并且设置了进城自动拉起，所以chime-agent掉线时，会被系统进程自动地拉起，即可以看作chime-agent进程和计算节点生命周期一致。

###### 场景4 其它非严重硬件故障

有时候，硬件的故障并不会导致服务器关机，或者网络不可达这样的可以直接察觉的严重故障。有些硬件故障比如磁盘故障导致的I/O异常、网络设备故障导致的丢包等，程序并不会直接修改计算节点的状态。针对这种故障，ChimeStack提供了完善的监控机制来发现各种硬件设备的异常数据，比如网口丢包等，运维人员根据监控报警信息，人工确认后再手动执行运维操作，比如建议，标记"Down"等。 