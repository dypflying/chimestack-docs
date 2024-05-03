---
title: Influxdb HA Settings
date: 2023-11-09
weight: 5
---

##### Overview

The solution for influxdb's high availability is relatively simple, that is to deploy two influxdb instances on 2 servers, whose API tokens as well as their orginization and bucket settings are all same. chime-agent writes logs to the dual influxdb databases simultaneously, and with the help of keepalived, setup a VIP address and make the 2 influxdb instances a master and a backup, all the query requests for influxdb's data are routed to the VIP address. In short, the solution is to dual writes to influxdb and query from the HA-ensured VIP address. 

Following is the architecture of the solution: 

![Influxdb HA](/images/influxdb_ha.png)


{{% alert title="Information" color="primary" %}}
One shortcoming of the deployment is when there are some exceptions occur due to network or hardwares of the servers' problem, there could be data consistency issue between the 2 influxdb's storage becasue some data may be lost, as a result, when the VIP address switches, the queries result maybe inconsistent.
{{% /alert %}}

##### chime-server's influxdb setting: 

requires 2 influxdb instances deployed on 2 servers respectively, such as:

|  Node  |     HostName      |        IP       |
|--------|---------------|-----------------|
| ServerNode1  | server1.chime.com  | 192.168.231.11 |
| ServerNode2  | server2.chime.com  | 192.168.231.12 |

VIP: 192.168.231.40

setup chime-server via the "chimeadm" tool: 

```
chimeadm initserver influxdb --vip-endpoint http://192.168.231.40:8086 \
  --real-endpoints http://192.168.231.11:8086,http://192.168.231.12:8086
  --token x5iGbxLx-2QKN64I3wooyZsHPtmGB4OvBspdSLuOcEBeN-_-rrnC_1GbtSrJrUD0-qSiXsYrKC0T4VF4m97ecw== \
  --org chime \
  --bucket chime \
```

###### Setup keepalived

edit /etc/keepalived/keepalived.conf file on server1, add or modify the following content:

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


edit /etc/keepalived/keepalived.conf file on server2, add or modify the following content:

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

restart the keepalived on server1 and server2 respectively

```
sudo systemctl restart keepalived
```

###### Other HA solutions

One solution is to use the open-sourced influx-cluster, more details refer to [Influxdb-cluster Deployement](https://github.com/chengshiwen/influxdb-cluster). Another solution is to use the official Influxdb Enterprise, more details refer to [Influx Enterprise Deployment](https://docs.influxdata.com/enterprise_influxdb/v1/), both of the 2 solutions could perform better HA than the solution provisioned in the chapter. 
