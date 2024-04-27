---
title: 1 Brief Introduction
description: A brief introduction to ChimeStack, its advantages, and its landscape
weight: 1
---

## What is ChimeStack？

ChimeStack is a new lightweight cloud computing IaaS software. ChimeStack is designed for small-scale private clouds, including edge computing and hyper-converged computing. ChimeStack provides a user-friendly Web UI, a command line tool and an administration tool, so you can deploy, operate and manage your private cloud platforms easily with limited effort.

## Why ChimeStack?

* **ChimeStack is lightweight** 
There are only two executable programs actually functioning in the ChimeStack framework, they are the management server program - "Chime-Server" and the client program - "Chime-Agent". Both are developed by Golang, no other libraries are needed and they occupy very limited system resources in the runtime. For instance, in the AllInOne deployment scenario, it only needs a server with 2 cores CPU and 4 GiB of memory to make the whole platform stack functionally work, and no more than 5 virtual machines can be launched simultaneously. It is essential for saving resources. 

* **ChimeStack supports convergence** 

ChimeStack supports both isolated computing/storage and converged computing/storage scenarios. In the isolation scenario, ChimeStack introduced a new storage engine(ChimeStor), which directs a virtual machine's I/O to the storage media in the same node where the virtual machine's instance is located. With such I/O affinity mechanism, it shortens the I/O path and reduces the network data transmission amount, hence improving the I/O performance such as reducing the I/O latency, etc. 
  
* **ChimeStack is simple** 
Not like other cloud platforms which deploy and maintain many components in parallel, occupy more system resources and require highly professional human skills and costly maintenance efforts. One of the initiatives of ChimeStack is to minimize the complexity of the cloud computing platform, such as by reducing the components as well as their interdependencies, and simplifying its deployment and maintenance, it costs 30 minutes to establish an AllInOne private cloud computing platform. 

## Landscape of ChimeStack
{{% imgproc chime-landscape Fit "1500x650" %}}
{{% /imgproc %}}

