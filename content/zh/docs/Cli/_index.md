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

### 获取计算规格列表

```
chimecli instance_spec listInstanceSpec
```

```
{
  "requestId": "8279a707-8df9-43ef-a183-0c74fb0e7c37",
  "result": {
    "elements": [
      {
        "cluster_count": 1,
        "created_at": "2023-08-27T18:55:03Z",
        "description": "instance_spec22aa",
        "memory": 536870912,
        "name": "instance_spec2",
        "state": 1,
        "type": 0,
        "uuid": "ac8bf72c-2c94-4695-97c8-cc3977ae8f11",
        "vcpus": 1
      },
      {
        "cluster_count": 3,
        "created_at": "2023-08-10T17:04:27Z",
        "description": "4 vcpus, 8g memory",
        "memory": 8589934592,
        "name": "Large(4C8G)",
        "state": 1,
        "type": 0,
        "uuid": "0b06e1d5-0d55-4c04-9837-dc0e74254f21",
        "vcpus": 1
      },
      {
        "cluster_count": 3,
        "created_at": "2023-08-10T17:04:18Z",
        "description": "2 vcpus, 4g memory",
        "memory": 4294967296,
        "name": "Medium(2C4G)",
        "state": 1,
        "type": 0,
        "uuid": "13f1fb24-2344-48ca-adc2-e7ccaa792a86",
        "vcpus": 1
      },
      {
        "cluster_count": 3,
        "created_at": "2023-06-25T00:43:55Z",
        "description": "1 vcpus, 1G memory",
        "memory": 1073741824,
        "name": "Mini(1C1G)",
        "state": 1,
        "type": 0,
        "uuid": "cd047e9d-2720-4397-84e5-777e4a39a531",
        "vcpus": 1
      }
    ],
    "size": 4,
    "total": 4
  }
}
```

### 新建计算规格

```
chimecli instance_spec createInstanceSpec --createInstanceSpecRequest.Name test-spec --createInstanceSpecRequest.Type 1 --createInstanceSpecRequest.Vcpus 1 --createInstanceSpecRequest.Memory 16777216
```

```
{
  "requestId": "544abc7a-9a56-4275-9de6-54b0fef875ad",
  "result": {
    "instance_spec": {
      "cluster_count": 0,
      "created_at": "2024-04-18T00:20:28.771276054Z",
      "description": "",
      "memory": 16777216,
      "name": "test-spec",
      "state": 1,
      "type": 1,
      "uuid": "849075e3-7b00-498d-9061-83996f3d370c",
      "vcpus": 1
    }
  }
}
```

### 查看计算规格

```
chimecli instance_spec getInstanceSpec --InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c
```

```
{
  "requestId": "891d47c6-92d6-44db-a48f-8c4312ba9f56",
  "result": {
    "instance_spec": {
      "cluster_count": 0,
      "created_at": "2024-04-18T00:20:29Z",
      "description": "",
      "memory": 16777216,
      "name": "test-spec",
      "state": 1,
      "type": 1,
      "uuid": "849075e3-7b00-498d-9061-83996f3d370c",
      "vcpus": 1
    }
  }
}
```


### 修改计算规格

```
chimecli instance_spec updateInstanceSpec --InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c --createInstanceSpecRequest.Type 1 --createInstanceSpecRequest.Vcpus 2 --createInstanceSpecRequest.Name test-spec --createInstanceSpecRequest.Memory 16777216
```

```
{
  "requestId": "7c5d3460-83b5-48e8-84bd-a3a8b912c908",
  "result": {
    "instance_spec": "ok"
  }
}
```

### 删除计算规格

```
chimecli instance_spec deleteInstanceSpec --InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c 
{"requestId":"1b24222f-0158-4d10-84c8-c478157e2465","result":1}
```

```
{
  "requestId": "1b24222f-0158-4d10-84c8-c478157e2465",
  "result": 1
}
```

### 关联计算规格到集群

```
chimecli instance_spec createClusterInstanceSpecRelation --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 --createClusterInstanceSpecRequest.InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c
```

```
{
  "requestId": "3a5673a2-6c6c-4096-a8f1-6caa18d7c74e",
  "result": {
    "cluster_instance_spec_relation": {
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-04-18T08:49:37.401057582+08:00",
      "instance_spec_uuid": "849075e3-7b00-498d-9061-83996f3d370c"
    }
  }
}
```

### 解除计算规格和集群的关联

```
chimecli instance_spec deleteClusterInstanceSpecRelation --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 --InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c
```

```
{
  "requestId": "ebf4f99d-37fb-45f2-935e-ba99052a3af7",
  "result": 1
}
```

### 查看集群的计算规格列表

```
chimecli instance_spec listClusterInstanceSpecRelation --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774
```

```
{
  "requestId": "a4be9b2b-4080-4cdf-8536-d2ceead7e514",
  "result": {
    "elements": [
      {
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2023-09-08T01:39:31Z",
        "instance_spec_name": "instance_spec2",
        "instance_spec_uuid": "ac8bf72c-2c94-4695-97c8-cc3977ae8f11",
        "memory": 536870912,
        "vcpus": 1
      },
      {
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2023-08-28T23:10:41Z",
        "instance_spec_name": "Large(4C8G)",
        "instance_spec_uuid": "0b06e1d5-0d55-4c04-9837-dc0e74254f21",
        "memory": 8589934592,
        "vcpus": 1
      },
      {
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2023-08-24T19:26:02Z",
        "instance_spec_name": "Mini(1C1G)",
        "instance_spec_uuid": "cd047e9d-2720-4397-84e5-777e4a39a531",
        "memory": 1073741824,
        "vcpus": 1
      },
      {
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2023-08-24T19:16:52Z",
        "instance_spec_name": "Medium(2C4G)",
        "instance_spec_uuid": "13f1fb24-2344-48ca-adc2-e7ccaa792a86",
        "memory": 4294967296,
        "vcpus": 1
      }
    ],
    "size": 4,
    "total": 4
  }
}
```

## 存储规格相关命令

### 获取存储规格列表

```
chimecli volume_spec listVolumeSpec
```

```
{
  "requestId": "30b85eb5-fdb5-48c7-9bee-e7049aa2dce5",
  "result": {
    "elements": [
      {
        "cluster_count": 2,
        "created_at": "2023-08-27T19:28:05Z",
        "description": "aaaaaa",
        "max_iops": 1000,
        "max_throughput": 314572800,
        "min_iops": 100,
        "min_throughput": 31457280,
        "name": "test",
        "state": 1,
        "step_iops": 10,
        "step_throughput": 10485760,
        "storage_pool_name": "Local Storage Pool",
        "storage_pool_uuid": "f5165a18-e6b3-42b4-8efc-ad496f318a0a",
        "uuid": "9fb4dc3a-88ec-4360-a823-55b0f19bf146"
      },
      {
        "cluster_count": 2,
        "created_at": "2023-08-17T02:50:29Z",
        "description": "performance volume specification1",
        "max_iops": 10000,
        "max_throughput": 524288000,
        "min_iops": 1000,
        "min_throughput": 52428800,
        "name": "Performance",
        "state": 1,
        "step_iops": 100,
        "step_throughput": 5242880,
        "storage_pool_name": "Local Storage Pool",
        "storage_pool_uuid": "f5165a18-e6b3-42b4-8efc-ad496f318a0a",
        "uuid": "af52a0fe-f1fc-483c-9197-aead9786a73a"
      },
      {
        "cluster_count": 1,
        "created_at": "2023-06-25T19:22:10Z",
        "description": "standard volume spec",
        "max_iops": 5000,
        "max_throughput": 104857600,
        "min_iops": 500,
        "min_throughput": 10485760,
        "name": "Standard",
        "state": 1,
        "step_iops": 50,
        "step_throughput": 1048576,
        "storage_pool_name": "Local Storage Pool",
        "storage_pool_uuid": "f5165a18-e6b3-42b4-8efc-ad496f318a0a",
        "uuid": "38112d5c-7f13-438a-aec5-d14de51bd30f"
      }
    ],
    "size": 3,
    "total": 3
  }
}
```

### 新建存储规格

```
chimecli volume_spec createVolumeSpec --createVolumeSpecRequest.Name test-volume-spec --createVolumeSpecRequest.MaxIops 1000 --createVolumeSpecRequest.MinIops 500 --createVolumeSpecRequest.StepIops 10 --createVolumeSpecRequest.MaxThroughput 104857600 --createVolumeSpecRequest.MinThroughput 10485760 --createVolumeSpecRequest.StepThroughput 1048576 --createVolumeSpecRequest.StoragePoolUuid f5165a18-e6b3-42b4-8efc-ad496f318a0a
```

```
{
  "requestId": "64467277-5058-458d-867f-8b1ac46cb8e1",
  "result": {
    "volume_spec": {
      "cluster_count": 0,
      "created_at": "2024-04-18T01:10:08.048543501Z",
      "description": "",
      "max_iops": 1000,
      "max_throughput": 104857600,
      "min_iops": 500,
      "min_throughput": 10485760,
      "name": "test-volume-spec",
      "state": 1,
      "step_iops": 10,
      "step_throughput": 1048576,
      "storage_pool_name": "",
      "storage_pool_uuid": "f5165a18-e6b3-42b4-8efc-ad496f318a0a",
      "uuid": "c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa"
    }
  }
}
```

### 查看存储规格

```
chimecli volume_spec getVolumeSpec --VolumeSpecUuid c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa
```

```
{
  "requestId": "68bb6050-b78f-4012-ba01-4834e3116be3",
  "result": {
    "volume_spec": {
      "cluster_count": 0,
      "created_at": "2024-04-18T01:10:08Z",
      "description": "",
      "max_iops": 1000,
      "max_throughput": 104857600,
      "min_iops": 500,
      "min_throughput": 10485760,
      "name": "test-volume-spec",
      "state": 1,
      "step_iops": 10,
      "step_throughput": 1048576,
      "storage_pool_name": "Local Storage Pool",
      "storage_pool_uuid": "f5165a18-e6b3-42b4-8efc-ad496f318a0a",
      "uuid": "c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa"
    }
  }
}
```

### 修改存储规格

```
chimecli volume_spec updateVolumeSpec --VolumeSpecUuid c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa --createVolumeSpecRequest.Name test-volume-spec --createVolumeSpecRequest.MaxIops 1000 --createVolumeSpecRequest.MinIops 500 --createVolumeSpecRequest.StepIops 10 --createVolumeSpecRequest.MaxThroughput 104857600 --createVolumeSpecRequest.MinThroughput 10485760 --createVolumeSpecRequest.StepThroughput 10485760 --createVolumeSpecRequest.StoragePoolUuid f5165a18-e6b3-42b4-8efc-ad496f318a0a
```

```
{
  "requestId": "6594c3cb-2a6a-4fcc-85d1-00746b29c980",
  "result": {
    "volume_spec": "ok"
  }
}
```

### 删除存储规格

```
chimecli volume_spec deleteVolumeSpec --VolumeSpecUuid c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa
```

```
{
  "requestId": "7f7800e9-0057-44a5-9340-c46fda540dbe",
  "result": 1
}
```


### 关联存储规格到集群

```
chimecli volume_spec createClusterVolumeSpecRelation --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 --createClusterVolumeSpecRequest.VolumeSpecUuid c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa
```

```
{
  "requestId": "2850087e-9e72-4cf7-986b-64a7d5cb88b4",
  "result": {
    "cluster_volume_spec_relation": {
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-04-18T09:29:46.257989386+08:00",
      "volume_spec_uuid": "c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa"
    }
  }
}
```

### 解除关联存储规格和集群

```
chimecli volume_spec deleteClusterVolumeSpecRelation --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 --VolumeSpecUuid c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa
```

```
{
  "requestId": "85e088bc-9b81-4172-b3ee-0f61da006106",
  "result": 1
}
```
### 查看集群的存储规格列表

```
chimecli volume_spec listClusterVolumeSpecRelation --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774
```

```
{
  "requestId": "b6c98def-9d89-40cd-a59a-4caf4dc15de0",
  "result": {
    "elements": [
      {
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2023-08-28T23:21:26Z",
        "max_iops": 1000,
        "max_throughput": 314572800,
        "min_iops": 100,
        "min_throughput": 31457280,
        "step_iops": 10,
        "step_throughput": 10485760,
        "volume_spec_name": "test",
        "volume_spec_uuid": "9fb4dc3a-88ec-4360-a823-55b0f19bf146"
      },
      {
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2023-08-17T02:50:41Z",
        "max_iops": 10000,
        "max_throughput": 524288000,
        "min_iops": 1000,
        "min_throughput": 52428800,
        "step_iops": 100,
        "step_throughput": 5242880,
        "volume_spec_name": "Performance",
        "volume_spec_uuid": "af52a0fe-f1fc-483c-9197-aead9786a73a"
      },
      {
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2023-08-11T01:58:10Z",
        "max_iops": 5000,
        "max_throughput": 104857600,
        "min_iops": 500,
        "min_throughput": 10485760,
        "step_iops": 50,
        "step_throughput": 1048576,
        "volume_spec_name": "Standard",
        "volume_spec_uuid": "38112d5c-7f13-438a-aec5-d14de51bd30f"
      }
    ],
    "size": 3,
    "total": 3
  }
}
```

## 网络配置相关命令

### 获取网络列表

```
chimecli network listNetwork --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774
```

```
{
  "requestId": "f346cf6e-12e3-4580-bbd8-66f7bf9388b4",
  "result": {
    "elements": [
      {
        "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
        "cluster_name": "Default",
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2023-07-20T02:02:31Z",
        "description": "bridge1",
        "interface_name": "ens224",
        "name": "br1",
        "state": 1,
        "type": 0,
        "uuid": "52899f98-3963-4ae0-abde-2ea72e27f2b6",
        "vlan_id": ""
      }
    ],
    "size": 1,
    "total": 1
  }
}
```

### 新建网络

```
chimecli network createNetwork --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 --createNetworkRequest.Type 0 --createNetworkRequest.Name br1 --createNetworkRequest.InterfaceName ens224
```

```
{
  "requestId": "3abf33eb-dae3-4a61-8331-5a53163e7362",
  "result": {
    "network": {
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "cluster_name": "",
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "0001-01-01T00:00:00Z",
      "description": "",
      "interface_name": "ens224",
      "name": "br1",
      "state": 0,
      "type": 0,
      "uuid": "f2a515db-7699-4970-b13c-a8ea9840f62e",
      "vlan_id": ""
    }
  }
}
```

### 查看网络

```
chimecli network getNetwork --NetworkUuid 52899f98-3963-4ae0-abde-2ea72e27f2b6
```

```
{
  "requestId": "235ff7b9-3364-475f-8800-8bc064e90134",
  "result": {
    "network": {
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "cluster_name": "Default",
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2023-07-20T02:02:31Z",
      "description": "bridge1",
      "interface_name": "ens224",
      "name": "br1",
      "state": 1,
      "type": 0,
      "uuid": "52899f98-3963-4ae0-abde-2ea72e27f2b6",
      "vlan_id": ""
    }
  }
}
```

### 修改网络

```
chimecli network updateNetwork --NetworkUuid 52899f98-3963-4ae0-abde-2ea72e27f2b6 --updateNetworkRequest.Name br1 --updateNetworkRequest.Description br1-network
```

```
{
  "requestId": "484f5728-ee8f-44a1-a1df-4b156b9d58a5",
  "result": {
    "network": "ok"
  }
}
```
### 删除网络

```
chimecli network deleteNetwork --NetworkUuid 52899f98-3963-4ae0-abde-2ea72e27f2b6
```

```
{
  "requestId": "2594ebfe-cc1c-44a2-965c-cad7bc9fbd55",
  "result": 1
}
```

### 获取子网列表

```
chimecli network listSubnet --NetworkUuid f2a515db-7699-4970-b13c-a8ea9840f62e --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774
```

```
{
  "requestId": "e417211d-0676-4cf2-8fa0-d7376dc4d562",
  "result": {
    "elements": [
      {
        "cidr": "192.168.231.1/26",
        "created_at": "2024-04-18T04:21:30Z",
        "description": "",
        "gateway": "192.168.231.0",
        "name": "subnet1",
        "network_name": "br1",
        "network_uuid": "f2a515db-7699-4970-b13c-a8ea9840f62e",
        "reserved_ips": "",
        "state": 1,
        "type": 0,
        "uuid": "e73efdf7-d232-4556-ba95-3851100a47b7"
      }
    ],
    "size": 1,
    "total": 1
  }
}
```

### 新建子网

```
chimecli network createSubnet --NetworkUuid f2a515db-7699-4970-b13c-a8ea9840f62e --createSubnetRequest.CIDR 192.168.231.200/30 --createSubnetRequest.Name subnet2
```

```
{
  "requestId": "77f9400f-b573-4f6b-a17d-2b331a4212c9",
  "result": {
    "subnet": {
      "cidr": "192.168.231.200/30",
      "created_at": "2024-04-18T04:28:28.794229055Z",
      "description": "",
      "gateway": "192.168.231.200",
      "name": "subnet2",
      "network_name": "",
      "network_uuid": "f2a515db-7699-4970-b13c-a8ea9840f62e",
      "reserved_ips": "",
      "state": 1,
      "type": 0,
      "uuid": "fed410bf-da50-490f-a045-314b08dc8ad5"
    }
  }
}
```
### 查看子网

### 更新子网

### 删除子网


## 存储池相关命令


## 镜像相关命令


## 报警相关命令


## 统计相关命令


## 虚拟机操作相关命令

## 云硬盘相关命令

## 弹性网卡相关命令