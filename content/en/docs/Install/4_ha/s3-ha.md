---
title: S3 HA Settings
date: 2023-11-09
weight: 5
---

Currently there are couples of 3rd S3 softwares which are designed with high available solutions. Chimestack recommends using the Minio as the S3 provider and its multi-node, multi-drive deployment model to achive HA for S3. 

This chapter introduces how to deploy the Minio's MNMD in production

##### Environment Preparation

Requires 2 nodes, and 3 hard disks per node, such as:

|  Node        |     HostName      |        IP       |                     Disks               |
|--------------|-------------------|-----------------|-----------------------------------------|
| ServerNode1  | server1.chime.com |  192.168.231.11 | /dev/nvme0n2,/dev/nvme0n3,/dev/nvme0n4  |
| ServerNode2  | server2.chime.com |  192.168.231.12 | /dev/nvme0n2,/dev/nvme0n3,/dev/nvme0n4  |

VIP: 192.168.231.50 and its domain name: s3.chime.com

format the hard disks as xfs filesystem and mount them to the planned directories on both server1 and server2 

```
mkfs.xfs /dev/nvme0n2 && mkfs.xfs /dev/nvme0n3 && mkfs.xfs /dev/nvme0n4 
mkdir -p /minio/disk1 && mkdir -p /minio/disk2 && mkdir -p /minio/disk3
mount /dev/nvme0n2 /minio/disk1
mount /dev/nvme0n3 /minio/disk2
mount /dev/nvme0n4 /minio/disk3
```

add a user named minio-user and the a user group with the same name on both server1 and server2, and change the directories' owner to minio-user, such as: 

```
groupadd -r minio-user
useradd -M -r -g minio-user minio-user
chown -R minio-user:minio-user /minio/disk1 /minio/disk2 /minio/disk3 
```

##### Install Minio 

Install minio on server1 and server2 respecitvely

```
wget https://dl.min.io/server/minio/release/linux-amd64/archive/minio-20240406052602.0.0-1.x86_64.rpm -O minio.rpm
sudo dnf install minio.rpm
```

##### Configure minio

Create a new /etc/default/minio file on server1 and server2 respectively, a minio process will read necessary running parameters from this file during its startup. And add following content: 

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

###### Start minio cluster

Start minio process on server1 and server2 respectively，then check the status of the the minio process:

```
sudo systemctl start minio 
systemctl status minio
```

###### Configure keepalived+lvs

Edit /etc/keepalived/keepalived.conf file on server1, add or modify the following content:

```
vrrp_instance VI_4 {
    state MASTER                   # master node
    interface ens160               # network interface of management network
    virtual_router_id 54           # must be consistent with other nodes'
    priority 255                   # weight, must not be less than other nodes'
    advert_int 1
    authentication {
        auth_type PASS             # authentification method
        auth_pass 1111             # authentification password
    }
    virtual_ipaddress {
        192.168.231.50            # VIP address
    }
}

virtual_server 192.168.231.50 9000 {
    delay_loop 6
    lb_algo rr                      # load balancing algorithm
    lb_kind NAT                     # lvs work mode
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 9000 {  # real server1's IP address and port
        weight
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 9000 {  # real server2's IP address and port
        weight 1
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3
        }
    }
}
```


Edit /etc/keepalived/keepalived.conf file on server2, add or modify the following content:

```
vrrp_instance VI_4 {
    state BACKUP                   # backup node
    interface ens160               # network interface of management network
    virtual_router_id 54           # must be consistent with other nodes'
    priority 254                   # weight, must not be more than master node's
    advert_int 1
    authentication {
        auth_type PASS             # authentification method
        auth_pass 1111             # authentification password
    }
    virtual_ipaddress {
        192.168.231.50            # VIP address
    }
}

virtual_server 192.168.231.50 9000 {
    delay_loop 6
    lb_algo rr                      # load balancing algorithm
    lb_kind NAT                     # lvs working mode
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 9000 {  # real server1's IP address and port
        weight
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 9000 {  # real server2地址和端口
        weight 1
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3
        }
    }
}
```

restart keepalived to make the configuration changes take into effect

```
sudo systemctl restart keepalived
```

Access minio's Web conole via http://s3.chime.com:9001/, or access minio's API via s3.chime.com:9000 for testing the installation.