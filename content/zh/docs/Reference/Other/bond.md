---
title: 网卡绑定介绍
weight: 3
---

### 网卡绑定介绍

**bond的7种模式介绍**
1. Mode0(balance-rr): 平衡抡循环策略
2. Mode1(active-backup): 主备策略
3. Mode2(balance-xor): 平衡策略
4. Mode3(broadcast): 广播策略
5. Mode4(802.3ad): 动态链接聚合
6. Mode5(balance-tlb): 适配器传输负载均衡
7. Mode6(balance-alb): 适配器适应性负载均衡

下面介绍在linux中如何配置归一的网络接口名称。

##### 1.centos7+ 推荐的配置方法

**注意:** 不推荐用直接更改或者新建/etc/sysconfig/network-scripts/目录下接口文件的方式，用nmcli命令会自动生成配置文件。 

首先，用nmcli命令添加一个新bond，示例采取bond0作为名称，bond模式为 balance-rr (mode0)
```
nmcli connection add con-name bond0 ifname bond0 type bond mode balance-rr
nmcli connection show     
```

然后，把需要做成bond的网口作为slave添加到新bond接口，如下将接口ens160和ens224添加到bond0 
```
nmcli connection add con-name slave-160 ifname ens160 type ethernet master bond0
nmcli connection add con-name slave-224 ifname ens224 type ethernet master bond0
nmcli connection show 
```

然后修改bond0的参数，比如ip地址，gateway，dns等。
```
nmcli connection modify bond0 ipv4.method manual connection.autoconnect yes ipv4.addresses 192.168.231.160/24 ipv4.dns 8.8.8.8 ipv4.gateway 192.168.231.2
nmcli connection show 
```

最后重启相关的接口
```
  nmcli connection up slave-160
  nmcli connection up slave-224
  nmcli connection up bond0 
```

##### 2.centos6 推荐的配置方法

进入网卡配置文件所在目录
```
cd /etc/sysconfig/network-scripts/   
```

创建ifcfg-bond0文件
```
vim  ifcfg-bond0 
```

编辑如下
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

分别编辑ens160和ens224文件如下
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

重启网络服务
```
service network restart
```