---
title: Introduction To ChimeStack Roadmap
---

{{% blocks/cover title="ChimeStack Roadmap" image_anchor="top" height="10" color="primary"  %}}
{.mt-1}
{{% /blocks/cover %}}


{{% blocks/section color="default" type="row" %}}

- Version 0.1 (released)
  - [Introducntion To ChimeStack V0.1 Features](/en/release/landscape)
- Version 0.2 (In developmemnt, target release in 2024Q4)
  - ChimeStor storage type, including backend storage engine, cleint(qemu) iSCSI protocol support, I/O affinity scheduling, and ChimeStor volume lifecycle management.
  - Create virtual machines, volumes and Nics in batch.
  - Dedicated physical CPU scheduling for virtual machines
  - Change root's password online
  - Upgrade/downgrade the setting of a virtual machine
  - QGA detecting for guest OS
- Version 0.3 (2025Q1)
  - ChimeStor storage's snapshoting feature
  - GPU's virtualization
  - Volume resizing
  - Create new virtual machine without a start
- Version 1.0 (2025Q2)
  - Tag service
  - Virtual machine's affinity and anti-affinity scheduling
  - NFS storage type
- Version 1.1 (2025Q3)
  - VPC(virtual private cloud)
  - NAT gateway service
  - Load balancing service

{{% /blocks/section %}}


