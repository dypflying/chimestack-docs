---
title: 3.5 Limitation
weight: 5
description: Introducion to the limitation of ChimeStack's objects
---


|Object|Object Type|Limitation Description|
|---|---|---|
|Available Zone|Platform Resource|up to 32 zones|
|Cluster|Platform Resource|up to 32 clusters for single available zone|
|Node(Host)|Platform Resource|up to 256 nodes for single cluster|
|Storage Pool|Platform Resource|up to 16 storage pools for single cluster|
|Layer-2 Network|Platform Resource|up to 16 layer-2 networks for single cluster|
|Subnet|Platform Resource|up to 16 subnets for single layer-2 network|
|Instance Specification|Platform Resource|no limitation in total, but up to 32 instance specifications can be associated with a single cluster|
|Volume Specification|Platform Resource|no limitation in total, but up to 32 volume specifications can be associated with a single cluster|
|Image Bucket|Platform Resource|only one public image bucket, each user has a self-owned image bucket|
|Virtual Machine|Virtualized Resource|no limitation|
|Image|Virtualized Resource|no limitation|
|Volume|Virtualized Resource|no limitation in total，but each virtual machine can attach up to 128 volumes|
|Snapshot|Virtualized Resource|up to 32 snapshots for a single volume|
|NIC|Virtualized Resource|no limitation in total，but each virtual machine can attach up to 16 virtual NICs|
|Security Group|Virtualized Resource|up to 16 security group for one user|