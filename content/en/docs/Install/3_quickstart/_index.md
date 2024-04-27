---
title: 2.3 Quick Start
description: This chapter introduces how to deploy an all-in-one ChimeStack platform
weight: 4
---

**Followings are the listening ports used in all-in-one deployed environment**:

| Port | Component    | Description               |
|------|--------------|---------------------------|
| 8801 | chime-server | chime-server's API service's port          ｜
| 8802 | chime-server | chime-server's gRPC port for communicating with chime-agents| 
| 8033 | chime-portal | chime portal's service port |
| 8811 | chime-agent  | chime-agent's gRPC port for comminicating with chime-server | 
| 3306 | mysql        | mysql's default service port  |
| 8086 | influxdb     | influxdb's default service port | 
| 9000 | minio        | minio's default service port if use minio for providing s3 service | 