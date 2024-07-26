---
title: 2.3 快速开始一个AllInOne的ChimeStack
description: 本章介绍如何快速部署配置一个AllInOne的ChimeStack
weight: 4
---

**AllInOne部署时，启用监听端口列表**:

| 端口 | 进程    | 描述               |
|------|--------------|---------------------------|
| 8801 | chime-server | server对外API端口          |
| 8802 | chime-server | server和agent之间gRPC通信端口| 
| 8033 | chime-portal | portal对外服务端口 |
| 8811 | chime-agent  | server和agent之间grpc通信端口 | 
| 3306 | mysql        | mysql默认服务端口  |
| 8086 | influxdb     | influxdb默认服务端口 | 
| 9000 | minio        | 默认s3服务组件minio服务端口 | 