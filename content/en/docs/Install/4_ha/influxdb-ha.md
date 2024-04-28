---
title: Influxdb HA Settings
date: 2023-11-09
weight: 5
---

##### 概述

ChimeStack关于influxdb高可用的解决方案比较简单，通过部署双活influxdb实例+keepalived来实现高可用的目的。即部署两个influxdb实例在两台不同的服务器上，两台服务器的influxdb除了访问地址外，其它访问配置(token, org, bucket)完全相同。对influxdb的写入全部都是双写，即数据是同时写入两个influxdb中，此外，通过keepalived配置虚拟VIP并配置主从influxdb实例，当出现主influxdb故障时，VIP会切换到从服务器上。对influxdb数据的检索都是通过这个VIP访问的，这样保证了重要的报警指标数据检索的高可用性。

架构示意图如下所示: 

![Influxdb HA](/images/influxdb_ha.png)

其中通过物理网口的IP地址访问的influxdb的endpoint叫做real endpoint, 通过VIP访问influxdb的endpoint叫做vip endpoint，客户端对influxdb的数据写入是直接写入全部的real endpoint，而对influxdb数据的读取是通过vip endpoint。

{{% alert title="提示" color="primary" %}}
这种部署的一个弊端是，由于网络、服务器可能出现的异常，两个influxdb的数据可能不完全一致，当发生VIP切换时，可能出现信息不一致问题。
{{% /alert %}}

##### chime-server的influxdb配置

规划两台服务器(Node)运行influxdb: 

|  Node  |     HostName      |        IP       |
|--------|---------------|-----------------|
| ServerNode1  | server1.chime.com  | 192.168.231.11 |
| ServerNode2  | server2.chime.com  | 192.168.231.12 |

VIP: 192.168.231.40

通过chimeadm配置chime-server: 

```
chimeadm initserver influxdb --vip-endpoint http://192.168.231.40:8086 \
  --real-endpoints http://192.168.231.11:8086,http://192.168.231.12:8086
  --token x5iGbxLx-2QKN64I3wooyZsHPtmGB4OvBspdSLuOcEBeN-_-rrnC_1GbtSrJrUD0-qSiXsYrKC0T4VF4m97ecw== \
  --org chime \
  --bucket chime \
```

###### 配置keepalived


在server1编辑 /etc/keepalived/keepalived.conf, 添加如下内容

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
        192.168.231.40
    }

    track_script {
        chk_influxdb
    }
}
```


在server2编辑 /etc/keepalived/keepalived.conf, 添加如下内容

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
        192.168.231.40
    }

    track_script {
        chk_influxdb
    }
}
```

然后server1和server2分别重启keepalived: 

```
sudo systemctl restart keepalived
```

###### 其它高可用方案

客户也可以采取开源的influx-cluster方案，具体参考 [influxdb-cluster部署配置](https://github.com/chengshiwen/influxdb-cluster)，或者influxdb官方付费版的Influxdb Enterprise方案, 具体参考 [官方Influx Enterprise部署配置](https://docs.influxdata.com/enterprise_influxdb/v1/)，这两种方案的可用性/可靠性均优于influxdb双写+keepalived的方案，但部署成本和经济成本均比较高，客户可以综合考虑比较收益和成本进行选择。
