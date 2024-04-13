---
title: 安装Keepalived 
date: 2023-11-09
weight: 1
---

ChimeStack中很多组件的高可用实现依赖keepalived, keepalived 提供了一个负载均衡和一个高可用性的框架：

- 负载均衡框架依赖于非常著名的Linux虚拟服务器（IPVS）内核模块，该模块提供4层负载均衡。
- 高可用框架实现了虚拟冗余路由协议——VRRP，VRRP是路由器故障转移的基本模块。 

这两个框架都均可以独立使用或者一起使用，以提供弹性基础设施。


### 安装 keepalived 

通过yum或者dnf安装keepalived: 

```
sudo yum install -y keepalived
```

启动并设置为系统开机启动进程:

```
sudo systemctl enable keepalived
sudo systenctl start keepalived
```

查看keepalived的运行状态:

```
systemctl status keepalived
```