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

### 查看Host列表

```
chimecli host listHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
```

```
{
  "requestId": "4fbe3aaa-e491-4dc2-8eb3-f821a17b9883",
  "result": {
    "elements": [
      {
        "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
        "cluster_name": "Default",
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2024-04-11T10:57:34Z",
        "description": "",
        "manage_ip": "192.168.231.128",
        "name": "host-a428263d",
        "physical_memory": 0,
        "physical_vcpus": 0,
        "rack_name": "rack1",
        "reserved_memory": 0,
        "reserved_vcpus": 0,
        "state": 0,
        "total_memory": 0,
        "total_vcpus": 0,
        "used_memory": 0,
        "used_vcpus": 0,
        "uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a"
      },
      {
        "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
        "cluster_name": "Default",
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2024-04-01T11:18:54Z",
        "description": "",
        "manage_ip": "192.168.231.158",
        "name": "dennis",
        "physical_memory": 0,
        "physical_vcpus": 0,
        "rack_name": "rack1",
        "reserved_memory": 0,
        "reserved_vcpus": 0,
        "state": 1,
        "total_memory": 0,
        "total_vcpus": 0,
        "used_memory": 0,
        "used_vcpus": 0,
        "uuid": "a4824bcd-1112-449d-8d3e-3ff8b1323d9e"
      }
    ],
    "size": 2,
    "total": 2
  }
}
```

### 新注册Host

```
chimecli host createHost 
    --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
    --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
    --createHostRequest.CpuRatio 2.0 \
    --createHostRequest.CpuReserved 1 \
    --createHostRequest.MemoryRatio 2.0 \
    --createHostRequest.MemoryReserved 1024 \
    --createHostRequest.Uuid a428263d-64a9-4653-8d7e-556c20c0d77a
```

```
{
  "requestId": "d46b51f4-cb00-48bf-812d-6db4e589dd03",
  "result": {
    "host": {
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "cluster_name": "",
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-04-17T11:28:46.881807766Z",
      "description": "",
      "manage_ip": "192.168.231.128",
      "name": "host-a428263d",
      "physical_memory": 8291913728,
      "physical_vcpus": 4,
      "rack_name": "rack1",
      "reserved_memory": 1024,
      "reserved_vcpus": 1,
      "state": 1,
      "total_memory": 16583827456,
      "total_vcpus": 8,
      "used_memory": 0,
      "used_vcpus": 0,
      "uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a"
    }
  }
}
```

### 查看Host详情

```
chimecli host getHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
```

```
{
  "requestId": "843a98df-ab5d-43ed-8d86-84e7a09b3c42",
  "result": {
    "host": {
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "cluster_name": "Default",
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-04-11T10:57:34Z",
      "description": "",
      "manage_ip": "192.168.231.128",
      "name": "host-a428263d",
      "physical_memory": 8291917824,
      "physical_vcpus": 4,
      "rack_name": "rack1",
      "reserved_memory": 0,
      "reserved_vcpus": 0,
      "state": 0,
      "total_memory": 16583835648,
      "total_vcpus": 8,
      "used_memory": 1073741824,
      "used_vcpus": 1,
      "uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a"
    }
  }
}
```

### 修改Host 

```
chimecli host updateHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a --updateHostRequest.CpuRatio 2.0 --updateHostRequest.CpuReserved 1 --updateHostRequest.MemoryRatio 2.0 --updateHostRequest.MemoryReserved 0
```

```
{
  "requestId": "c6ad8b13-9e99-4441-b3a0-ac6a1b611306",
  "result": {
    "host": "ok"
  }
}
```

### 删除Host

```
chimecli host deleteHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
```

```
{
  "requestId": "b363317b-6299-426c-8412-178aeaf42326",
  "result": 1
}
```

### 启用Host

```
chimecli host enableHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
```

```
{
  "requestId": "217560f4-41af-4c61-b61f-4998cbc2f07f",
  "result": {
    "host": "ok"
  }
}
```

### 停用Host 

```
chimecli host disableHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
```

```
{
  "requestId": "63514320-0abc-41ac-97ee-6b5df5fc7424",
  "result": {
    "host": "ok"
  }
}
```


### 挂起Host 

```
chimecli host suspendHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
```

```
{
  "requestId": "cc9484e2-7e7c-4aaa-82f1-8492f05a34ec",
  "result": {
    "host": "ok"
  }
}
```

### 查看物理节点列表

```
chimecli host listClient
```

```
{
  "requestId": "bac39ae5-b097-4780-b122-383c1cc13295",
  "result": {
    "elements": [
      {
        "active_domains": 0,
        "created_at": "2024-04-11T10:56:57Z",
        "description": "",
        "domains": 0,
        "heartbeat_at": "2024-04-17T11:32:48Z",
        "manage_ip": "192.168.231.128",
        "name": "host-a428263d",
        "rack_name": "rack1",
        "state": 1,
        "used_memory": 0,
        "used_vcpus": 0,
        "uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a"
      },
      {
        "active_domains": 0,
        "created_at": "2024-04-01T11:07:49Z",
        "description": "",
        "domains": 0,
        "heartbeat_at": "2024-04-15T11:29:33Z",
        "manage_ip": "192.168.231.158",
        "name": "dennis",
        "rack_name": "rack1",
        "state": 1,
        "used_memory": 0,
        "used_vcpus": 0,
        "uuid": "a4824bcd-1112-449d-8d3e-3ff8b1323d9e"
      }
    ],
    "size": 2,
    "total": 2
  }
}
```

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