---
title: 3.1 Glossary
weight: 1
---

### Glossary of Plaform Resource
 
- Available Zone: A logical object represents a combination of a series of clusters. Physically, it usually represents a region, such as North China, East China, etc. The network latency for communication among clusters inside an available zone is usually limited to a smaller time-elapse range, such as 3ms, 5ms, etc.
- Cluster: A cluster consists of a group of physical servers, which can communicate with each other and often have similar configurations (usually identical configured). A cluster must be managed by one control plane program. 
- Node(Host): A node/host represents a physical server. In the ChimseStack architecture, a node can only belong to one cluster. However, a node can act as either one, two, or all roles out of the 3 roles of nodes(management node, computing node, and storage node). For instance, for an AllInOne deployment, the server acts as all of the roles.   
- Layer-2 Network: The ChimeStack requires defining at least one layer-2 network, because virtual machines depend on the layer-2 network to communicate.
- Subnet: Inside a layer-2 network, it can be divided into several subnets based on customized requirements, each subnet can be managed independently.
- Sotrage Pool: A storage pool represents a group of storage resources (servers as well as their hard disks) that are virtualized into a whole pool for storage, and with which allocates virtualized storage resources on demand. In the ChimeStack architecture, there are 3 kinds of storage pools, such as local pool, Ceph pool, and ChimeStor pool. The local storage pool uses the native storage resources on the same node where the instance runs, which performs best for read and write I/O, but lacks of high-availability mechanism; the Ceph storage pool and the ChimeStor storage pool can either be deployed in the same computing cluster or deployed in a separated cluster. For a converged deployment, ChimeStor's engine has better performance and less system resource consumption.
- Image Bucket: An image bucket physically represents a S3 bucket, which contains a group of system images, and there must be one but only one public image bucket in ChimeStack's control plane, each user has one dedicated image bucket.
- Public Image: The system image resources for all users.
- Instance Specification: A series of virtual machine's specification definitions. It is required to specify an instance specification when creating a virtual machine.
- Volume Specification: A combination of the size and I/O performance parameters of virtual cloud disk specification definitions.

### Glossary of Virtualization Resource

- Virtual Machine Instance: Virtualized computer resources.
- Private Image: User's self uploaded system image resources. 
- Volume: Virtualized hard disk resources, which can attach to virtual machines.s 
- Snapshot: Snapshots of volumes.
- Virtualized Network Interface: A virtualized NIC contains a MAC address as well as an IP address, it can be attached to any virtual machines belonging to the same user.
- Security Group: A set of network access control definitions, a virtual machine associated with a security group follows its network access control definitions. 