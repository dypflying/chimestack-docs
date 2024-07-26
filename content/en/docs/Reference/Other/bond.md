---
title: Network Interface Bonding
weight: 3
---

### Introduction to Network Interface Bonding

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