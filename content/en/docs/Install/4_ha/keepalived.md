---
title: Install Keepalived 
date: 2023-11-09
weight: 1
---

ChimeStack's key components relies on the Keepalived for implementing the high-availability, Keepalived provides a load balancing and high-availability framework to linux system.

- The load balancing framework relies on the well-known Linux virtual server - IPVS kernel module, which provides a 4-layer network load balancing engine.
- The high availability framework implements the Virtual Redundancy Routing Protocol - VRRP, which is the basic module for router's failover. 

The two frameworks can be used together or separately to provide HA and elastic infrastructures.

### Install Keepalived 

You can install the keepalived by the "yum" or "dnf" command in Redhat linux: 

```
sudo yum install -y keepalived
```

Start and enable the keepalived process start on boot:

```
sudo systemctl enable keepalived
sudo systenctl start keepalived
```

Check the runtime status of the keepalived process:

```
systemctl status keepalived
```