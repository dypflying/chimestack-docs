---
title: 2.2 Environment Preparation
date: 2023-11-09
description: This chapter introduces how to prepare the environment prior to the installation of ChimeStack platform.
weight: 3
---

### 1. Regularize network interface's names

Since ChimeStack uses either a 2-networks(management and business network) or a 3-network(management, business, and storage network), for automatic operation purposes, it is essential to unify the network interface’s names for each network respectively, such as taking “bond0” as the NIC name for the management network, “bond1” for the business network and “bond2” for the storage network.

There are two solutions for normalizing network interface names:

1. Disable the system's automatic network interface name (not recommended)

Edit /etc/default/grub file, modify or add the following content: 

```
GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"
```

Then restart the system. 

```
sudo update-grub
sudo reboot
```

**Note: the solution is not recommended**


2. Make network interface bonding(recommended)

It is recommended to bond network interfaces as a unified name. On the one hand, it can normalize the interface names of each network. On the other hand, because modern physical network cards often have more than two interfaces, stacking bonds across network cards can also improve the availability and efficiency of network cards.

Details refer to [Introduction to Network Interface Bonding](/en/docs/reference/other/bond)

### System Setup

##### turn off the firewall

```
sudo systemctl stop firewalld.service 
sudo systemctl disable firewalld.service 
```

Or

```
sudo service firewalld stop
sudo chkconfig firewalld off
```

##### turn off selinux 

Modify the selinux configuration file

```
sudo vim /etc/selinux/config
```

Change following content as: 

```
SELINUX=disabled
```

##### turn off swap(recommended) permanently

Comment out the "swap" device line in /etc/fstab, for instance: 
```
#/dev/mapper/cl_chime--cicd-swap none                    swap    defaults        0 0
```

Then restart the system to put the change into effect.

##### enable IP forwarding

```
vim /etc/sysctl.conf 
```

Modify or add following setting:

```
net.ipv4.ip_forward = 1
```

##### optimize kernel's parameters(optional)

Modify the maximum file handlers and process handlers
```
echo "* soft nproc 65536 " >> /etc/security/limits.conf
echo "* hard nproc 65536 " >> /etc/security/limits.conf
echo "* soft nofile 65536 " >> /etc/security/limits.conf
echo "* hard nofile 65536 " >> /etc/security/limits.conf
```

Optimize network properties，for instance, modify the /etc/sysctl.conf file as following
```
# sudo vim /etc/sysctl.conf

net.ipv4.tcp_syncookies=1 
net.ipv4.tcp_tw_reuse=1 
net.ipv4.tcp_tw_recycle=1
net.ipv4.tcp_fin_timeout=30

net.ipv4.tcp_keepalive_time=30 
net.ipv4.ip_local_port_range=1024 65535
net.ipv4.tcp_max_syn_backlog=65536
net.ipv4.tcp_max_tw_buckets=5000

net.core.netdev_max_backlog=32768
net.core.somaxconn=32768 

net.ipv4.tcp_synack_retries=2
net.ipv4.tcp_syn_retries=2

net.ipv4.tcp_wmem=8192 436600 873200
net.ipv4.tcp_rmem=32768 436600 873200
net.ipv4.tcp_mem=94500000 91500000 92700000

net.ipv4.tcp_max_orphans=3276800

net.ipv4.tcp_fastopen=3

```

After modification，put the change into effect by: 
```
sysctl -p
```