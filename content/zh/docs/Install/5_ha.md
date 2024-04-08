---
title: 2.5 高可用配置
date: 2023-11-09
description: 本章对介绍如何配置高可用ChimeStack
weight: 6
---

## chime-server的高可用配置

chime-server的高可用的实现主要依赖keepalive, kepalived 提供了一个负载均衡和一个高可用性的框架：

- 负载均衡框架依赖于非常著名的Linux虚拟服务器（IPVS）内核模块，该模块提供第4层负载均衡。
- 高可用框架实现了虚拟冗余路由协议——VRRP，VRRP是路由器故障转移的基本模块。 

这两个框架都均可以独立使用或者一起使用，以提供弹性基础设施。

根据keepalive的框架功能，chime-server的高可用可以实现active-standby的模式（主备），或者active-active的模式(双活或多活)，下面分别介绍通过keepalive实现两种模式的配置

### 安装 keepalived 

运行下面命令: 

```
sudo yum install -y keepalived
```

编辑keepalived的配置文件:

```
sudo vim /etc/keepalived/keepalived.conf
```

启动并设置开机启动:

```
sudo systemctl enable keepalived
sudo systenctl start keepalived
```

### chime-server主备(active-standby)配置

在规划的chime-server主节点上, 安装keepalived并编辑/etc/keepalived/keepalived.conf, 添加或修改以下部分: 

```
vrrp_script chk_server {
    script "/usr/bin/pgrep chime-server" # or "nc -zv localhost 8801" 检查进程或者端口的可达性
    interval 2                           # default: 1s  检查间隔
}


vrrp_instance VI_1 {
    state MASTER                         # 设置当前为默认主节点
    interface ens160                     # 管理网网口的名称
    virtual_router_id 51                 # 重要，必须和其它从节点的router_id一致
    priority 255                         # 权重，不小于从节点的数值
    advert_int 1
    authentication {
        auth_type PASS                   # 认证方式
        auth_pass 1111                   # 认证密码
    }
    virtual_ipaddress {
        192.168.231.161                  # VIP地址
    }
    track_script {
        chk_server                       # 健康检查设置
    }
}
```


在规划的chime-server从节点上, 安装keepalived并编辑/etc/keepalived/keepalived.conf, 添加或修改以下部分: 

```
vrrp_script chk_server {
    script "/usr/bin/pgrep chime-server" # or "nc -zv localhost 8801" 检查进程或者端口的可达性
    interval 2                           # default: 1s  检查间隔
}


vrrp_instance VI_1 {
    state BACKUP                         # 设置当前为默认从节点
    interface ens160                     # 管理网网口的名称
    virtual_router_id 51                 # 重要，必须和其它节点的router_id一致
    priority 254                         # 权重，不大于主节点的数值
    advert_int 1
    authentication {
        auth_type PASS                   # 认证方式
        auth_pass 1111                   # 认证密码
    }
    virtual_ipaddress {
        192.168.231.161                  # VIP地址
    }
    track_script {
        chk_server                       # 健康检查设置
    }
}
```

配置完成后均需重启keepalived

```
sudo systemctl restart keepalived 
```

配置后即可通过VIP访问chime-server，例如通过"http://192.168.231.161:8033/"访问Web UI，或通过"192.168.231.161:8801"访问API

当chime-server进程不可达或者主服务器down机时，VIP会从主节点漂移到从节点；当主节点服务恢复时，VIP会从从节点漂移回主节点。

### chime-server双活(active-active)配置

{{% alert title="提示" color="warning" %}}
对于分布式系统在多活模式下，可能出现事务一致性问题，chime-server通过添加记录锁，基本实现了在多活模式下事物一致性的保障，但目前版本测试尚未充分，所以暂时不建议采用多活的配置，仍然推荐主备的配置方式。
{{% /alert %}}



## chime-agent 高可用介绍


## 依赖组件的高可用配置介绍

### mysql高可用


### influxdb高可用


### s3高可用



