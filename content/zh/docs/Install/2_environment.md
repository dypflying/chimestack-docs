---
title: 2.2 环境准备
date: 2023-11-09
description: 本章对ChimeStack云平台运行所须的基本环境配置进行说明。
weight: 3
---

### 网卡名称统一

chime-stack常规使用两个网络(管理网+业务网)或者三个网络(管理网+业务网+存储网)，为了归一自动化运维，每张网络中的网络接口名称需要统一，比如管理网用bond0作为名称，业务网用bond1作为名称，存储网用bond2作为名称。

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
nmcli connection add con-name slave-224 ifname ens160 type ethernet master bond0
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

### 系统准备

##### 关闭防火墙

```
sudo systemctl stop firewalld.service 
sudo systemctl disable firewalld.service 
```

或

```
sudo service firewalld stop
sudo chkconfig firewalld off
```

##### 关闭selinux 

修改配置文件

```
sudo vim /etc/selinux/config
```

修改文件内容如下

```
SELINUX=disabled
```

##### 关闭swap(推荐)

在/etc/fstab 中注释掉swap的行，例如
```
#/dev/mapper/cl_chime--cicd-swap none                    swap    defaults        0 0
```

更改后需要重新启动系统

##### 开启IP转发功能

```
vim /etc/sysctl.conf 
```

添加或者修改以下配置

```
net.ipv4.ip_forward = 1
```

##### 优化系统内核参数(可选)

优化系统最大打开文件数和最大进程数
```
echo "* soft nproc 65536 " >> /etc/security/limits.conf
echo "* hard nproc 65536 " >> /etc/security/limits.conf
echo "* soft nofile 65536 " >> /etc/security/limits.conf
echo "* hard nofile 65536 " >> /etc/security/limits.conf
```

优化网络参数，修改/etc/sysctl.conf文件
```
# sudo vim /etc/sysctl.conf

net.ipv4.tcp_syncookies=1 #表示开启SYNCookies。当出现SYN等待队列溢出时，启用cookies来处理，可防范少量SYN攻击
net.ipv4.tcp_tw_reuse=1 #表示开启重用。允许将TIME-WAITsockets重新用于新的TCP连接
net.ipv4.tcp_tw_recycle=1 #表示开启TCP连接中TIME-WAITsockets的快速回收
net.ipv4.tcp_fin_timeout=30 #修改系統默认的TIMEOUT 时间

net.ipv4.tcp_keepalive_time=30 #表示当keepalive起用的时候，TCP发送keepalive消息的频度。
net.ipv4.ip_local_port_range=1024 65535 #表示用于向外连接的端口范围
net.ipv4.tcp_max_syn_backlog=65536 #表示SYN队列的长度，默认为1024，加大队列长度为8192，可以容纳更多等待连接的网络连接数
net.ipv4.tcp_max_tw_buckets=5000 #表示系统同时保持TIME_WAIT的最大数量

net.core.netdev_max_backlog=32768 #每个网络接口接收数据包的速率比内核处理这些包的速率快时，允许送到队列的数据包的最大数目
net.core.somaxconn=32768 

net.ipv4.tcp_synack_retries=2 #三次握手中的第二次握手,该设置决定了内核放弃连接之前发送SYN+ACK包的数量
net.ipv4.tcp_syn_retries=2 #内核放弃建立连接之前发送SYN包的数量

net.ipv4.tcp_wmem=8192 436600 873200 #TCP写buffer
net.ipv4.tcp_rmem=32768 436600 873200 #TCP读buffer
net.ipv4.tcp_mem=94500000 91500000 92700000 #TCP压力的阈值设定

net.ipv4.tcp_max_orphans=3276800 #系统中最多有多少个TCP套接字不被关联到任何一个用户文件句柄上

net.ipv4.tcp_fastopen=3 #对于内核版高于于3.7.1，可启用tcp_fastopen

```

修改完，令配置生效
```
sysctl -p
```