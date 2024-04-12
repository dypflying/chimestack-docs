---
title: 2.3 快速开始
description: 本章介绍如何快速部署配置一个All-In-One的ChimeStack
weight: 4
---

**All-In-One部署时，启用监听端口列表**:

| Port | Component    | Description               |
|------|--------------|---------------------------|
| 8801 | chime-server | server对外API端口          ｜
| 8802 | chime-server | server和agent之间通过grpc通信, server侧端口| 
| 8033 | chime-portal | portal对外服务端口 |
| 8811 | chime-agent  | server和agent之间通过grpc通信, agent侧端口 | 
| 3306 | mysql        | mysql默认服务端口  |
| 8086 | influxdb     | influxdb默认服务端口 | 
| 9000 | minio        | 如果s3服务软件选择minio的话，默认服务端口 | 