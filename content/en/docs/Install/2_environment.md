---
title: 2.2 Environment Preparation
date: 2023-11-09
description: This chapter introduces how to prepare the environment prior to the installation of ChimeStack platform.
weight: 3
---

### Regularize network interface's names

Since ChimeStack uses either a 2-networks(management and business network) or a 3-network(management, business and storage network), for automatically operation purpose, it is essential to unify the network interface's names for each network respectively, such as take "bond0" as the NIC name for the management network, "bond1" for the business network and "bond2" for the storage network.

**introduction to the 7 common network bonding modes**
1. Mode0(balance-rr): Round-robin policy
2. Mode1(active-backup): Active-backup policy
3. Mode2(balance-xor): XOR policy
4. Mode3(broadcast): Broadcast policy
5. Mode4(802.3ad): IEEE 802.3ad Dynamic link aggregation policy
6. Mode5(balance-tlb): Adaptive transmit load balancing policy
7. Mode6(balance-alb): Adaptive load balancing policy

Following introduces how to configure a unified network interface name in Linux platform

##### 1.Centos7 and later Recommended Configuration Method

**Note:** 
It is **not** recommended to edit or compose the network interface configuration files in /etc/sysconfig/network-scripts/ directory, because the linux provisioned "nmcli" tool, will generate these files automatically.

Firstly, create a new bonding network interface named, for example, bond0, with the bonding mode of balance-rr (mode0)
```
nmcli connection add con-name bond0 ifname bond0 type bond mode balance-rr
nmcli connection show     
```

Secondly, add the physical network interface as slaves to the new bonding interface, for instance, the following commands will add the interfaces of "ens160" and ens224 to "bond0"
```
nmcli connection add con-name slave-160 ifname ens160 type ethernet master bond0
nmcli connection add con-name slave-224 ifname ens224 type ethernet master bond0
nmcli connection show 
```

Thirdly, modify the properties of the "bond0" interface, such as IP address, gateway, dns, etc. 
```
nmcli connection modify bond0 ipv4.method manual connection.autoconnect yes ipv4.addresses 192.168.231.160/24 ipv4.dns 8.8.8.8 ipv4.gateway 192.168.231.2
nmcli connection show 
```

Finally, restart the related network interfaces
```
  nmcli connection up slave-160
  nmcli connection up slave-224
  nmcli connection up bond0 
```

##### 2.Centos6 Recommended Configuration Method

Enter the network intetface configuration direcory
```
cd /etc/sysconfig/network-scripts/   
```

Create a file named "ifcfg-bond0"
```
vim  ifcfg-bond0 
```

Edit the "ifcfg-bond0" as following
```
DEVICE=bond0
TYPE=Ethernet
ONBOOT=yes
NM_CONTROLLER=no
IPADDR=192.168.231.160 
NETMASK=255.255.255.0
GATEWAY=192.168.231.2
BONDING_OPTS="miimin=100 mode=0"

```

Edit the slave interface configuration files of "ens160" and "ens224" respectively as following 
```
DEVICE=ens160
TYPE=Ethernet
ONBOOT=yes
NM_CONTROLLER=no
SLAVE=yes
MASTER=bond0
```

```
DEVICE=ens224
TYPE=Ethernet
ONBOOT=yes
NM_CONTROLLER=no
SLAVE=yes
MASTER=bond0
```

Restart the network daemon service
```
service network restart
```

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