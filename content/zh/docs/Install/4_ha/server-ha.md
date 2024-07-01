---
title: server/portal的高可用配置
date: 2023-11-09
weight: 2
---

### 主备(active-standby)配置方案

在规划的chime-server主节点上(server1.chime.com), 安装keepalived并编辑/etc/keepalived/keepalived.conf, 添加或修改以下部分: 

```
vrrp_script chk_server {
    script "/usr/bin/pgrep chime-server" # or "nc -zv localhost 8801" 检查进程或者api端口的可达性
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
        192.168.231.10                  # VIP地址
    }
    track_script {
        chk_server                       # 健康检查设置
    }
}
```


在规划的chime-server从节点上(server2.chime.com), 安装keepalived并编辑/etc/keepalived/keepalived.conf, 添加或修改以下部分: 

```
vrrp_script chk_server {
    script "/usr/bin/pgrep chime-server" # or "nc -zv localhost 8801" 检查进程或者api端口的可达性
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
        192.168.231.10                  # VIP地址
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

配置后即可通过VIP访问chime-server，例如通过"http://192.168.231.10:8033/"访问Web UI，或通过"192.168.231.10:8801"访问API

当chime-server进程不可达或者主服务器down机时，VIP会从主节点漂移到从节点；当主节点服务恢复时，VIP会从从节点漂移回主节点。

### 双活(active-active)配置方案

{{% alert title="提示" color="warning" %}}
对于分布式系统在多活模式下，可能出现事务的一致性问题，chime-server通过对待执行的事务前置记录锁，基本保障了在多活管控进程事务的一致性。但目前dev-x.x.x版本测试尚未充分，所以对于Dev版本的ChimeStack不建议采用多活的配置，仍然推荐主备的配置方式来实现chime-server进程的高可用。
{{% /alert %}}

在多活(双活)模式下，各chime-server会根据选择的load balancing算法接受请求，但只有一个服务器可以接收入口请求，也就是说，只有其中一个服务器作为路由器接收外部请求，然后分发到所有可达的chime-server实例来响应请求。这种方式是keepalived+lvs的经典场景，即keepalived提供虚拟路由(VIP)、健康检测和故障failover功能，lvs负责负载均衡。

其中lvs可以选择的三种模式是: NAT,DR和TUN。

负载均衡算法有：rr(Round Robin), wrr(Weighted Round Robin), lc(Least Connection), wlc(Weighted Least Connection), sh(Source Hashing), dh(Destination Hashing), lblc(Locality-Based Least Connection)

在规划的chime-server主节点上, 安装keepalived并编辑/etc/keepalived/keepalived.conf, 添加或修改以下部分: 

```
vrrp_instance VI_1 {
    state MASTER                   # 设置当前为默认主节点
    interface ens160               # 管理网网口的名称
    virtual_router_id 51           # 重要，必须和其它节点的router_id一致
    priority 255                   # 权重，不小于从节点的数值
    advert_int 1
    authentication {
        auth_type PASS             # 认证方式
        auth_pass 1111             # 认证密码
    }
    virtual_ipaddress {
        192.168.231.10            # chime-server VIP地址
        192.168.231.20            # chime-portal VIP地址
    }
}

virtual_server 192.168.231.20 80 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 8033 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 8033 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}

virtual_server 192.168.231.10 8801 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 8801 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 8801 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}

virtual_server 192.168.231.10 8802 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 8802 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 8802 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}
```


在规划的chime-server从节点上, 安装keepalived并编辑/etc/keepalived/keepalived.conf, 添加或修改以下部分: 

```
vrrp_instance VI_1 {
    state BACKUP                   # 设置当前为默认从节点
    interface ens160               # 管理网网口的名称
    virtual_router_id 51           # 重要，必须和其它节点的router_id一致
    priority 255                   # 权重，不大于主节点的数值
    advert_int 1
    authentication {
        auth_type PASS             # 认证方式
        auth_pass 1111             # 认证密码
    }
    virtual_ipaddress {
        192.168.231.10             # chime-server VIP地址
        192.168.231.20             # chime-portal VIP地址
    }
}

virtual_server 192.168.231.20 80 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 8033 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 8033 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}


virtual_server 192.168.231.10 8801 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 8801 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 8801 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}

virtual_server 192.168.231.10 8802 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 8802 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 8802 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}
```


配置完成后server1和server2均需重启keepalived

```
sudo systemctl restart keepalived 
```

### 验证高可用

通过VIP访问chime-server:
- 通过 "http://192.168.231.20/" 访问Web UI
- 通过 "192.168.231.10:8801" 访问API

在server1节点运行: 

```
ip -br a 
```

确认VIP(192.168.231.10/20)在网卡ens160上

停止server1的chime-server: 

```
sudo systemctl stop chime-server
```

在server2，确认VIP(192.168.231.10/20)在网卡ens160上，并通过VIP访问Web UI及API，确认功能正常。

然后启动server1的chime-server: 

```
sudo systemctl start chime-server
```

分别检查server1和server2，确认VIP(192.168.231.10/20)在server1的网卡ens160上，并通过VIP访问Web UI及API，功能正常。