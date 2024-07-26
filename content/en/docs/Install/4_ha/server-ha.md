---
title: Server/Portal HA Settings
date: 2023-11-09
weight: 2
---

### Active-standby scheme

On the planed master node for chime-server(server1.chime.com), install keepalived and edit /etc/keepalived/keepalived.conf file, add or modify the following content:

```
vrrp_script chk_server {
    script "/usr/bin/pgrep chime-server" # or "nc -zv localhost 8801" # test the aliveness of the process or test the connectivity to API service's port
    interval 2                           # default: 1s  test interval
}


vrrp_instance VI_1 {
    state MASTER                         # master node
    interface ens160                     # network inerface for the management network
    virtual_router_id 51                 # important, the router id must be consistent with other nodes'
    priority 255                         # weight value, master node's weight value must not be less than slave nodes'
    advert_int 1
    authentication {
        auth_type PASS                   # authentification method 
        auth_pass 1111                   # authentification password
    }
    virtual_ipaddress {
        192.168.231.10                   # VIP address
    }
    track_script {
        chk_server                       # health check scripts
    }
}
```


On the planed slave node for chime-server(server2.chime.com), install keepalived and edit /etc/keepalived/keepalived.conf file, add or modify the following content:

```
vrrp_script chk_server {
    script "/usr/bin/pgrep chime-server" # or "nc -zv localhost 8801" test the aliveness of the process or test the connectivity to API service's port
    interval 2                           # default: 1s  test interval
}


vrrp_instance VI_1 {
    state BACKUP                         # slave node
    interface ens160                     # network inerface for the management network
    virtual_router_id 51                 # important, the router id must be consistent with other nodes'
    priority 254                         # weight value, slave node's weight value must not be more than master node's
    advert_int 1
    authentication {
        auth_type PASS                   # authentification method 
        auth_pass 1111                   # authentification password
    }
    virtual_ipaddress {
        192.168.231.10                   # VIP address
    }
    track_script {
        chk_server                       # health check scripts
    }
}
```

It needs a restart of keepalived after changing the configuration:

```
sudo systemctl restart keepalived 
```

After the restart, you can access the chime-server's services via the VIP address，such as "http://192.168.231.10:8033/" for Web UI,  or "192.168.231.10:8801" for API service.

In case the chime-server’s services in the master node are not accessible or the master node is down, the VIP address will shift to one of the slave nodes; And when the master node and the chime-server in the master recover, the VIP address will shift back to the master node automatically.

### Active-active Scheme

{{% alert title="Warning" color="warning" %}}
Like other distributed systems, chime-server in multiple-active schemes has to solve the consistency issue as well. The chime-server's implementation manages to solve the consistency issue by adding record locks to the transactions before executing them. However, the current dev-x.x.x version of ChimeStack has not been tested sufficiently for the consistency cases, so by now it is still not recommended to use the active-active scheme for chime-server's deployment, while the active-standby scheme is recommended.
{{% /alert %}}

In multi-active (active-active) mode, each chime-server will receive requests distributed by the load balancer with a specific load-balancing algorithm, but only one node in the node group takes the role of the load-balancing router to receive the external requests and distribute them to chime-servers. The scheme can be implemented by the classic combination of "keepalived"+"lvs", that is, the keepalived framework provides virtual routing(VIP), health checks and failover mechanism, and the lvs framework provisions the load-balancing.

You can choose one of the lvs's working modes: NAT,DR and TUN。

You can choose one of the load balancing algorithms: rr(Round Robin), wrr(Weighted Round Robin), lc(Least Connection), wlc(Weighted Least Connection), sh(Source Hashing), dh(Destination Hashing), lblc(Locality-Based Least Connection)

On the master node of chime-server, install keepalived and edit /etc/keepalived/keepalived.conf file, add or modify the following content: 

```
vrrp_instance VI_1 {
    state MASTER                   # master node
    interface ens160               # network inerface for the management network
    virtual_router_id 51           # important, the router id must be consistent with other nodes'
    priority 255                   # weight value, master node's weight value must not be less than slave nodes'
    advert_int 1
    authentication {
        auth_type PASS             # authentification method 
        auth_pass 1111             # authentification password
    }
    virtual_ipaddress {
        192.168.231.10            # chime-server's VIP address
        192.168.231.20            # chime-portal's VIP address
    }
}

virtual_server 192.168.231.20 80 {
    delay_loop 6
    lb_algo rr                      # load-balancing algorithm
    lb_kind NAT                     # lvs working mode
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 8033 {  # IP address and port of real server#1
        weight
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 8033 {  # IP address and port of real server#2
        weight 1
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3
        }
    }
}

virtual_server 192.168.231.10 8801 {
    delay_loop 6
    lb_algo rr                      # load-balancing algorithm
    lb_kind NAT                     # lvs working mode
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 8801 {  # IP address and port of real server#1
        weight
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 8801 {  # IP address and port of real server#2
        weight 1
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3
        }
    }
}

virtual_server 192.168.231.10 8802 {
    delay_loop 6
    lb_algo rr                      # load-balancing algorithm
    lb_kind NAT                     # lvs working mode
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 8802 {  # IP address and port of real server#1
        weight
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 8802 {  # IP address and port of real server#2
        weight 1
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3
        }
    }
}
```


On the slave node of chime-server, install keepalived and edit /etc/keepalived/keepalived.conf file, add or modify the following content: 

```
vrrp_instance VI_1 {
    state BACKUP                   # slave node
    interface ens160               # network inerface for the management network
    virtual_router_id 51           # important, the router id must be consistent with other nodes'
    priority 255                   # weight value, slave node's weight value must not be more than master nodes'
    advert_int 1
    authentication {
        auth_type PASS             # authentification method 
        auth_pass 1111             # authentification password
    }
    virtual_ipaddress {
        192.168.231.10             # chime-server's VIP address
        192.168.231.20             # chime-portal's VIP address
    }
}

virtual_server 192.168.231.20 80 {
    delay_loop 6
    lb_algo rr                      # load-balancing algorithm
    lb_kind NAT                     # lvs working mode
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 8033 {  # IP address and port of real server#1
        weight
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 8033 {  # IP address and port of real server#2
        weight 1
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3
        }
    }
}


virtual_server 192.168.231.10 8801 {
    delay_loop 6
    lb_algo rr                      # load-balancing algorithm
    lb_kind NAT                     # lvs working mode
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 8801 {  # IP address and port of real server#1
        weight
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 8801 {  # IP address and port of real server#2
        weight 1
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3
        }
    }
}

virtual_server 192.168.231.10 8802 {
    delay_loop 6
    lb_algo rr                      # load-balancing algorithm
    lb_kind NAT                     # lvs working mode
    persistence_timeout 50
    protocol TCP

    real_server 192.168.231.11 8802 {  # IP address and port of real server#1
        weight
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3         
        }
    }
    real_server 192.168.231.12 8802 {  # IP address and port of real server#2
        weight 1
        TCP_CHECK {                     # health check via TCP
            connect_timeout 3
        }
    }
}
```

Restart keepalived service in both master node and slave node:

```
sudo systemctl restart keepalived 
```

### Test the high-availability of chime-server

Access chime-server by:
- "http://192.168.231.20/" for Web UI
- "192.168.231.10:8801" for API servie

In the node of server1, run shell command as following: 

```
ip -br a 
```

To confirm the VIP address(192.168.231.10/20) is on its network interface of ens160

Stop the chime-server process in server1:  

```
sudo systemctl stop chime-server
```

In the node of server2，confirm the VIP address (192.168.231.10/20) is on its network interface of ens160, and confirm the Web UI and API service of chime-server are accessible and functioning normally. 

Then start the chime-server process in the server1 again:  

```
sudo systemctl start chime-server
```

Check server1 and server2, confirm the VIP address (192.168.231.10/20) is back to the server1's network interface of ens160, and confirm the Web UI and API service of chime-server are accessible and functioning normally. 