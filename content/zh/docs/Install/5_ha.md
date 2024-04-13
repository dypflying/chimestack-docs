---
title: 2.4 高可用配置
date: 2023-11-09
description: 本章介绍如何配置让ChimeStack高可用，包括chime-server高可用、chime-agent高可用以及依赖的mysql, influxdb和s3的高可用部署。
weight: 6
---


### influxdb高可用

ChimeStack关于influxdb高可用的解决方案比较简单，通过部署双活influxdb实例+keepalived来实现高可用的目的。即部署两个influxdb实例在两台不同的服务器上，两台服务器的influxdb除了访问地址外，其它访问配置(token, org, bucket)完全相同。对influxdb的写入全部都是双写，即数据是同时写入两个influxdb中，此外，通过keepalived配置虚拟VIP并配置主从influxdb实例，当出现主influxdb故障时，VIP会切换到从服务器上。对influxdb数据的检索都是通过这个VIP访问的，这样保证了重要的报警指标数据检索的高可用性。

架构示意图如下所示: 

![Influxdb HA](/images/influxdb_ha.png)

其中通过物理网口的IP地址访问的influxdb的endpoint叫做real endpoint, 通过VIP访问influxdb的endpoint叫做vip endpoint，客户端对influxdb的数据写入是直接写入全部的real endpoint，而对influxdb数据的读取是通过vip endpoint。

{{% alert title="提示" color="primary" %}}
这种部署的一个弊端是，由于网络、服务器可能出现的异常，两个influxdb的数据可能不完全一致，当发生VIP切换时，可能出现信息不一致问题。
{{% /alert %}}

###### 配置chime-server

规划两台服务器(Node)运行influxdb: 

|  Node  |     Host      |        IP       |
|--------|---------------|-----------------|
| Node1  | influx-host1  | 192.168.231.141 |
| Node2  | influx-host2  | 192.168.231.142 |

VIP: 192.168.231.143

通过chimeadm配置chime-server: 

```
chimeadm initserver influxdb --vip-endpoint http://192.168.231.143:8086 \
  --real-endpoints http://192.168.231.141:8086,http://192.168.231.142:8086
  --token x5iGbxLx-2QKN64I3wooyZsHPtmGB4OvBspdSLuOcEBeN-_-rrnC_1GbtSrJrUD0-qSiXsYrKC0T4VF4m97ecw== \
  --org chime \
  --bucket chime \
```

###### 配置keepalived


在Node1编辑 /etc/keepalived/keepalived.conf, 添加如下内容

```
vrrp_script chk_influxdb {
    script "nc -zv localhost 8086"
    interval 2                   # default: 1s
}

vrrp_instance VI_3 {
    state MASTER
    interface ens160
    virtual_router_id 53
    priority 255
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        192.168.231.143
    }

    track_script {
        chk_influxdb
    }
}
```


在Node2编辑 /etc/keepalived/keepalived.conf, 添加如下内容

```
vrrp_script chk_influxdb {
    script "nc -zv localhost 8086"
    interval 2                   # default: 1s
}

vrrp_instance VI_3 {
    state BACKUP
    interface ens160
    virtual_router_id 53
    priority 254
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        192.168.231.143
    }

    track_script {
        chk_influxdb
    }
}
```

然后在Node1和Node2分别重启keepalived: 

```
sudo systemctl restart keepalived
```

###### 其它高可用方案

客户也可以采取开源的influx-cluster方案，具体参考 [influxdb-cluster部署配置](https://github.com/chengshiwen/influxdb-cluster)，或者influxdb官方付费版的Influxdb Enterprise方案, 具体参考 [官方Influx Enterprise部署配置](https://docs.influxdata.com/enterprise_influxdb/v1/)，这两种方案的可用性/可靠性均优于influxdb双写+keepalived的方案，但部署成本和经济成本均比较高，客户可以综合考虑比较收益和成本进行选择。


### s3高可用

s3软件几乎全部提供高可用的架构方案，ChimeStack推荐minio的多节点多硬盘方案实现高可用

###### 环境准备

下面介绍双节点，每个节点三个硬盘的方案

|  Node  |     HostName      |        IP       |                     Disks               |
|--------|-------------------|-----------------|-----------------------------------------|
| Node1  | node1.chime.com   | 192.168.231.171 | /dev/nvme0n2,/dev/nvme0n3,/dev/nvme0n4  |
| Node2  | node2.chime.com   | 192.168.231.172 | /dev/nvme0n2,/dev/nvme0n3,/dev/nvme0n4  |
| VIP    | minio.chime.com   | 192.168.231.170 |  |


**说明**: 方案用两台服务器提供minio的s3服务，每台机器规划三块硬盘为minio提供存储

在Node1和Node2分别格式化磁盘并挂载目录:

```
mkfs.xfs /dev/nvme0n2 && mkfs.xfs /dev/nvme0n3 && mkfs.xfs /dev/nvme0n4 
mkdir -p /minio/disk1 && mkdir -p /minio/disk2 && mkdir -p /minio/disk3
mount /dev/nvme0n2 /minio/disk1
mount /dev/nvme0n3 /minio/disk2
mount /dev/nvme0n4 /minio/disk3
```

在Node1和Node2分别编辑/etc/hosts: 

```
192.168.231.171 node1.chime.com
192.168.231.172 node2.chime.com
192.168.231.170 minio.chime.com
```

在Node1和Node2分别添加minio-user用户和用户组，并且改变存储目录所有者:

```
groupadd -r minio-user
useradd -M -r -g minio-user minio-user
chown -R minio-user:minio-user /minio/disk1 /minio/disk2 /minio/disk3 
```

###### 安装minio 

在Node和Node2分别安装minio

```
wget https://dl.min.io/server/minio/release/linux-amd64/archive/minio-20240406052602.0.0-1.x86_64.rpm -O minio.rpm
sudo dnf install minio.rpm
```

###### 配置minio

在Node和Node2分别新建(编辑) /etc/default/minio 文件，这个文件为minio进程运行时参数提供环境变量文件: 

```
# The MINIO_VOLUMES setting covers 2 MinIO hosts with 3 drives each at the specified hostname and drive locations.
MINIO_VOLUMES="http://node{1...2}.chime.com:9000/minio/disk{1...3}"

# console access port
MINIO_OPTS="--console-address :9001"

# the root username
MINIO_ROOT_USER=minioadmin

# the root password
MINIO_ROOT_PASSWORD=minioadmin

# the url(VIP) for the entrypoint of load balancer
MINIO_SERVER_URL="http://minio.chime.com:9000"
```

###### 启动minio集群

在node1和node2分别启动minio，并查看minio启动状态
```
sudo systemctl start minio 
systemctl status minio
```

###### 配置keepalived+lvs

在Node1编辑/etc/keepalived/keepalived.conf，添加如下配置:

```
vrrp_instance VI_4 {
    state MASTER                   # 设置当前为默认主节点
    interface ens160               # 管理网网口的名称
    virtual_router_id 54           # 重要，必须和其它节点的router_id一致
    priority 255                   # 权重，不小于从节点的数值
    advert_int 1
    authentication {
        auth_type PASS             # 认证方式
        auth_pass 1111             # 认证密码
    }
    virtual_ipaddress {
        192.168.231.170            # VIP地址
    }
}

virtual_server 192.168.231.170 9000 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.171 9000 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.172 9000 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}
```


在Node2编辑/etc/keepalived/keepalived.conf，添加如下配置:

```
vrrp_instance VI_4 {
    state BACKUP                   # 设置当前为默认主节点
    interface ens160               # 管理网网口的名称
    virtual_router_id 54           # 重要，必须和其它节点的router_id一致
    priority 254                   # 权重，不小于从节点的数值
    advert_int 1
    authentication {
        auth_type PASS             # 认证方式
        auth_pass 1111             # 认证密码
    }
    virtual_ipaddress {
        192.168.231.170            # VIP地址
    }
}

virtual_server 192.168.231.170 9000 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.171 9000 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.172 9000 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}
```

然后重启keepalived完成为minio服务添加的负载均衡服务: 

```
sudo systemctl restart keepalived
```

最后可以通过 http://minio.chime.com:9001/ 访问Web UI，或者通过 minio.chime.com:9000访问minio服务

