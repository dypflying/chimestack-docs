---
title: S3 HA Settings
date: 2023-11-09
weight: 5
---


当前流行的s3软件均能提供高可用的架构方案，ChimeStack推荐使用minio的多节点多硬盘架构实现服务的高可用

##### 环境准备

规划双节点，每个节点三个硬盘的方案:

|  Node        |     HostName      |        IP       |                     Disks               |
|--------------|-------------------|-----------------|-----------------------------------------|
| ServerNode1  | server1.chime.com |  192.168.231.11 | /dev/nvme0n2,/dev/nvme0n3,/dev/nvme0n4  |
| ServerNode2  | server2.chime.com |  192.168.231.12 | /dev/nvme0n2,/dev/nvme0n3,/dev/nvme0n4  |

VIP: 192.168.231.50, 域名: s3.chime.com

在server1和server2分别格式化磁盘为xfs文件系统并挂载目录:

```
mkfs.xfs /dev/nvme0n2 && mkfs.xfs /dev/nvme0n3 && mkfs.xfs /dev/nvme0n4 
mkdir -p /minio/disk1 && mkdir -p /minio/disk2 && mkdir -p /minio/disk3
mount /dev/nvme0n2 /minio/disk1
mount /dev/nvme0n3 /minio/disk2
mount /dev/nvme0n4 /minio/disk3
```

在server1和server2分别添加minio-user用户和用户组，并改变存储目录所有者:

```
groupadd -r minio-user
useradd -M -r -g minio-user minio-user
chown -R minio-user:minio-user /minio/disk1 /minio/disk2 /minio/disk3 
```

##### 安装minio 

在server1和server2分别安装minio

```
wget https://dl.min.io/server/minio/release/linux-amd64/archive/minio-20240406052602.0.0-1.x86_64.rpm -O minio.rpm
sudo dnf install minio.rpm
```

##### 配置minio

在server1和server2分别新建(编辑) /etc/default/minio 文件，这个文件为minio进程运行时参数提供环境变量文件: 

```
# The MINIO_VOLUMES setting covers 2 MinIO hosts with 3 drives each at the specified hostname and drive locations.
MINIO_VOLUMES="http://server{1...2}.chime.com:9000/minio/disk{1...3}"

# console access port
MINIO_OPTS="--console-address :9001"

# the root username
MINIO_ROOT_USER=minioadmin

# the root password
MINIO_ROOT_PASSWORD=minioadmin

# the url(VIP) for the entrypoint of load balancer
MINIO_SERVER_URL="http://s3.chime.com:9000"
```

###### 启动minio集群

在server1和server2分别启动minio，并查看minio启动状态
```
sudo systemctl start minio 
systemctl status minio
```

###### 配置keepalived+lvs

在server1编辑/etc/keepalived/keepalived.conf，添加如下配置:

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
        192.168.231.50            # VIP地址
    }
}

virtual_server 192.168.231.50 9000 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 9000 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 9000 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3
        }
    }
}
```


在server2编辑/etc/keepalived/keepalived.conf，添加如下配置:

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
        192.168.231.50            # VIP地址
    }
}

virtual_server 192.168.231.50 9000 {
    delay_loop 6
    lb_algo rr                      # 负载均衡算法
    lb_kind NAT                     # lvs 工作模式
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 9000 {  # real server1地址和端口
        weight
        TCP_CHECK {                     # 通过TCP健康检测
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 9000 {  # real server2地址和端口
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

最后可以通过 http://s3.chime.com:9001/ 访问Web UI，或者通过 s3.chime.com:9000访问minio服务