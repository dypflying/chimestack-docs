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

ChimeStack is **not** like other private-cloud software always takes along a big set of components and requires a complex deployment, complex operations, and maintenance, also takes up much physical resources in the runtime.

ChimeStack streamlines components and 3rd programs as many as possible, only depending on a few well-known 3rd software. And only two executable binaries make the ChimeStack run, one is the centralized management program named "chime-server" and the other one is the client-side program named "chime-agent" which is managed by the "chime-server" and runs as an agent in the node servers. The 2 binaries are both developed by Golang, no any other libraries will be deployed, and both binaries only take very limited physical resources in the runtime 

ChimeStack can be deployed on a single server(AllInOne), and can also be deployed in clustered servers of up to 100 nodes. For the AllInOne deployment, as a minimum requirement, it only needs 2 cores and 4 GiB memory to run a full-functioned ChimeStack cloud platform and 5 virtual machines can be created as well.

{{% /blocks/lead %}}

{{% blocks/lead %}}

**ChimeStack supports both converged and isolated computing/storage**

- In the isolation computing/storage scenario, the computing cluster and the storage cluster are managed independently, for instance, their capacity can be scaled in or out independently. Regardless of the cluster's physical independence, they work together and make the cloud computing virtualization service function as a whole.

- In the convergence scenario, ChimeStack introduces a new I/O affinity engine which always schedules the primary replication of the virtual machine's data to the nearest storage of the computing node where the virtual machine instance is located, so for the converged cases, the nearest storage to the computing is always the persistent disk on that node. The engine shortens the I/O read path and hence improves the I/O read efficiency. 

{{% /blocks/lead %}}

{{% blocks/lead %}}

**ChimeStack is simple**

ChimeStack provides a user-friendly Web GUI, and a command line tool to manage and operate resources, and provides whole APIs with documents and SDKs for any further development purposes.

{{% /blocks/lead %}}