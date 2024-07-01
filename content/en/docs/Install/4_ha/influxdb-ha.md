---
title: Influxdb HA Settings
date: 2023-11-09
weight: 5
---

##### Overview

The solution for influxdb’s high availability is relatively simple, that is to deploy two influxdb instances on 2 servers, whose API tokens as well as their organization and bucket settings are all the same. chime-agent writes logs to the dual influxdb databases simultaneously, and with the help of keepalived, set up a VIP address and make the 2 influxdb instances a master and a backup, all the query requests for influxdb’s data are routed to the VIP address. In short, the solution is to dual writes to the influxdb and query from the HA-ensured VIP address.

Following is the architecture of the solution: 

![Influxdb HA](/images/influxdb_ha.png)


{{% alert title="Information" color="primary" %}}
Due to certain exceptions that could occur from the network or server, data may not be able to be written to the dual InfluxDB instances completely successfully, so the data in the two InfluxDB instances may not be consistent.
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

One solution is to use the open-sourced influx-cluster, more details refer to [Influxdb-cluster Deployement](https://github.com/chengshiwen/influxdb-cluster). Another solution is to use the official Enterprise version of Influxdb, more details refer to [Influx Enterprise Deployment](https://docs.influxdata.com/enterprise_influxdb/v1/), both of the 2 solutions could perform better HA than the solution provisioned in the chapter. 
