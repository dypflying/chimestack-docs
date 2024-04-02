---
title: 环境准备
date: 2023-11-09
description: 本章对ChimeStack云平台运行所须的基本环境配置进行说明。
weight: 3
---

### 网卡名称统一

chime-stack常规使用两个网络(管理网+业务网)或者三个网络(管理网+业务网+存储网)，为了归一自动化运维，每张网络中的网络接口名称需要统一，比如管理网用bond0，业务网用bond1，存储网用bond2。下面介绍在linux中如何配置归一的网络接口名称。


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

##### 关闭swap

##### 开启IP转发功能

```
vim /etc/sysctl.conf 
```

添加或者修改以下配置

```
net.ipv4.ip_forward = 1
```

##### 优化系统参数(可选)


