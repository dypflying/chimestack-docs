---
title: 2.2 环境准备
date: 2023-11-09
description: 本章对ChimeStack云平台运行所须的基本环境配置进行说明。
weight: 3
---

### 1. 网卡名称归一化

chime-stack常规使用两个网络(管理网+业务网)或者三个网络(管理网+业务网+存储网)，为了达到自动化运维，每张网络中的网络接口名称需要统一，比如管理网统一用节点上的网络接口bond0作为名称，业务网统一用节点上的网络接口bond1作为名称，存储网统一用节点上的网络接口bond2作为名称。

网卡名称归一化可采用两种方案：
1. 禁止自动网卡名称(不推荐) 
   
   编辑 /etc/default/grub文件,修改如下内容:

   ```
   GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"
   ```

   然后重启系统: 

  ```
  sudo update-grub
  sudo reboot
  ```

  **注意: 不推荐这种方法。**

2. 对系统指定的网卡(自动)做绑定(推荐)
   
  推荐对网卡做bond的方案，一方面能归一化各网络的接口名称，另一方面，因为现代物理网卡往往都2个以上接口，这样跨网卡做堆叠bond还能提高网卡的可用性和效率。

  参考 [网卡绑定方法](../../reference/other/bond)

### 2. 系统准备

##### 2.1 关闭防火墙

```
sudo systemctl stop firewalld.service 
sudo systemctl disable firewalld.service 
```

或

```
sudo service firewalld stop
sudo chkconfig firewalld off
```

##### 2.2 关闭selinux 

修改配置文件

```
sudo vim /etc/selinux/config
```

修改文件内容如下

```
SELINUX=disabled
```

##### 2.3 关闭swap(推荐)

在/etc/fstab 中注释掉swap的行，例如
```
#/dev/mapper/cl_chime--cicd-swap none                    swap    defaults        0 0
```

更改后需要重新启动系统

##### 2.4 开启IP转发功能

```
vim /etc/sysctl.conf 
```

添加或者修改以下配置

```
net.ipv4.ip_forward = 1
```

##### 2.5 优化系统内核参数(可选)

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