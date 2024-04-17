---
title: 4 命令行CLI介绍
weight: 4
description: 介绍ChimeStack的命令行工具的使用方法
---

## 概述


## AZ相关命令


## Cluster相关命令

### 查看Cluster列表

```
chimecli cluster listCluster --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865
```

```
{
    "requestId": "0ef1d20c-3a78-4b16-b337-696bb601267b",
    "result": {
        "elements": [
            {
                "arch": "x86_64",
                "az_name": "Default",
                "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
                "created_at": "2023-08-17T19:54:43Z",
                "description": "dummy cluster",
                "hypervisor_type": "kvm",
                "name": "Dummy Cluster",
                "state": 1,
                "type": 1,
                "uuid": "6635fcef-438b-45cb-b4a8-949d39936870"
            },
            {
                "arch": "x86_64",
                "az_name": "Default",
                "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
                "created_at": "2023-06-15T08:02:31Z",
                "description": "default cluster 2",
                "hypervisor_type": "kvm",
                "name": "Default",
                "state": 1,
                "type": 0,
                "uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774"
            }
        ],
        "size": 2,
        "total": 2
    }
}
```

### 创建Cluster 

```
 chimecli cluster createCluster --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --createClusterRequest.Arch x86 --createClusterRequest.HypervisorType kvm --createClusterRequest.Name test-cluster --createClusterRequest.Type 1 
```

```
{
    "requestId": "8e3592e3-6581-4923-8292-e57418d128ad",
    "result": {
        "cluster": {
            "arch": "x86",
            "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
            "created_at": "2024-04-17T08:46:42.227101717Z",
            "description": "",
            "hypervisor_type": "kvm",
            "name": "test-cluster",
            "state": 1,
            "type": 1,
            "uuid": "e359211d-a882-4609-baad-db57557fdf2e"
        }
    }
}
```

### 查看Cluster 

```
chimecli cluster getCluster --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
```

```
{
    "requestId": "c48142ad-7ffa-4cbb-8a97-f9f7b757bb1e",
    "result": {
        "cluster": {
            "arch": "x86",
            "az_name": "Default",
            "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
            "created_at": "2024-04-17T08:46:42Z",
            "description": "",
            "hypervisor_type": "kvm",
            "name": "test-cluster",
            "state": 1,
            "type": 1,
            "uuid": "e359211d-a882-4609-baad-db57557fdf2e"
        }
    }
}
```

### 修改Cluster 

```
chimecli cluster updateCluster --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --createClusterRequest.Description 'cluster description' --createClusterRequest.Name 'test-cluster' 
```

```
{
  "requestId": "3bcdefae-d54a-4681-9004-fd163b997c90",
  "result": {
    "cluster": "ok"
  }
}
```

### 启用Cluster 

```
chimecli cluster enableCluster --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
```

```
{
  "requestId": "43684ea3-d36b-479d-9793-4fa98fb8b214",
  "result": {
    "cluster": "ok"
  }
}
```

### 停用Cluster 

```
chimecli cluster disableCluster --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
```

```
{
  "requestId": "0abc7fc0-eff4-45ec-870e-cb65a6abf2d7",
  "result": {
    "cluster": "ok"
  }
}
```

### 删除Cluster 

```
chimecli cluster deleteCluster --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
```

```
{
  "requestId": "39aa34ae-2a76-4409-b96a-212802364638",
  "result": 1
}
```

## Host相关命令


## 计算规格相关命令


## 存储规格相关命令


## 网络配置相关命令


## 存储池相关命令


## 镜像相关命令


## 报警相关命令


## 统计相关命令


## 虚拟机操作相关命令

## 云硬盘相关命令

## 弹性网卡相关命令