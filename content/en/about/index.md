---
title: About ChimeStack
linkTitle: About ChimeStack
menu: {main: {weight: 10}}
---

{{% blocks/cover title="About ChimeStack" image_anchor="bottom" height="auto" %}}
Cloud computing can not be easier
{.mt-5}

{{% /blocks/cover %}}

{{% blocks/lead %}}

**ChimeStack is lightweight**

ChimeStack is **not** like other private-cloud software takes along a big set of components requires complex deployment, operation, and maintenance, and consumes considerable physical resources in the runtime.

ChimeStack streamlines components and 3rd programs as many as possible, only depends on a few well-known 3rd softwares. The ChimeStack  rumtime framework only contains the management side process(chime-server), client side process(chime-agent) and storage service process(chime-stor). All these 3 programs are developed by Golang, and they only consume very limited physical resources in the runtime. 

 A ChimeStack cluster can be deployed on a single server(AllInOne), or be deployed in a group of servers that have no more than 256 nodes. For the AllInOne deployment, a minimum environment only requires 2 CPU cores and 4 GiB memory to run a full-functioned ChimeStack cloud platform as well as 5 virtual machines can be created.

{{% /blocks/lead %}}

{{% blocks/lead %}}

**ChimeStack supports both converged and separated computing/storage**

ChimeStack supports both scenarios.

In the hyper-converged scenario, ChimeStack's newly introduced engine(chime-stor) schedules the I/O of the virtual machine to the native storage of the node where the virtual machine locates as much as possible, greatly shortening the I/O paths in data transmission, improving performance and reducing network bandwidth usage.

In the separated scenario, ChimeStack enables virtual machines to connect to the Ceph cluster with the "librbd" protocol, or connect to other block storage services with the "iSCSI" protocol.

{{% /blocks/lead %}}

{{% blocks/lead %}}

**ChimeStack is simple**

One of the initiatives of ChimeStack is to have as less as middleware dependencies, less complex inter-module dependency topology, and simplify deployment and operation as much as possible. For instance, an AllInOne cloud environment can be deployed in 10 minutes.

ChimeStack provides a user-friendly Web GUI, and a command line tool to manage and operate the platform's resources and virtualized resources, and provides APIs and SDKs for further developing purposes.

{{% /blocks/lead %}}