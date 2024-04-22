---
title: 4 CLI介绍
weight: 4
description: 本章介绍ChimeStack命令行工具(CLI的使用方法
---

## 概述


## 可用区(AZ)操作命令


## 集群(Cluster)操作命令

### 查看Cluster列表

#### 命令原型

```
chimecli cluster listCluster --help
This will show clusters

Usage:
  chimecli cluster listCluster [flags]

Flags:
      --AzUuid string            Required. filter by the AZ's uuid
      --arch string              filter by the cluster's architecture
  -h, --help                     help for listCluster
      --hypervisor_type string   filter by the cluster's hypervisor type
      --name string              filter by the 'name' field
      --order string             'asc' or 'desc' of sorting
      --page int                 the page number of the results in paging
      --size int                 the page size of the results in paging
      --sort string              the field to be sorted by
      --state int                filter by the 'state' field
      --type int                 filter by the cluster's type (0: hyperconveged, 1:computing only, 2: storage only)
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|filter by the AZ's uuid|
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|state|integer|false|filter by the 'state' field|
|type|integer|false|filter by the cluster's type (0: hyperconveged, 1:computing only, 2: storage only)|
|hypervisor_type|string|false|filter by the cluster's hypervisor type|
|arch|string|false|filter by the cluster's architecture|


#### 示例

命令行:

```
chimecli cluster listCluster --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865
```

返回:

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

#### 命令原型

```
chimecli cluster createCluster --help
This will create a cluster in a specified Az

Usage:
  chimecli cluster createCluster [flags]

Flags:
      --AzUuid string                                Required. the AZ's uuid
      --Body string                                  Optional json string for [Body]. the http post body
      --createClusterRequest.Arch string             the cluster's architecture, like x86_64, arm, ...
      --createClusterRequest.Description string      description for the cluster
      --createClusterRequest.HypervisorType string   the cluster's hypervisor type, like kvm (default), xen, ...
      --createClusterRequest.Name string             Required. the cluster's name
      --createClusterRequest.Type int                the cluster's type
  -h, --help  
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|body|[CreateClusterRequest](#schemacreateclusterrequest)|false|the http post body|


**命令行替代body参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|CreateClusterRequest.Arch|string|false|the cluster's architecture, like x86_64, arm, ...|
|CreateClusterRequest.Description|string|false|description for the cluster|
|CreateClusterRequest.HypervisorType|string|false|the cluster's hypervisor type, like kvm (default), xen, ...|
|CreateClusterRequest.Name|string|true|the cluster's name|
|CreateClusterRequest.Type|integer|false|the cluster's type|

#### 示例

命令行:

```
 chimecli cluster createCluster \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --createClusterRequest.Arch x86 \
  --createClusterRequest.HypervisorType kvm \
  --createClusterRequest.Name test-cluster \
  --createClusterRequest.Type 1 
```

返回:

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

#### 命令原型

```
chimecli cluster getCluster --help
This will describe a cluster

Usage:
  chimecli cluster getCluster [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
  -h, --help                 help for getCluster

```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|

#### 示例

命令行:

```
chimecli cluster getCluster \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
```

返回: 

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

#### 命令原型

```
chimecli cluster updateCluster --help
This will update a cluster.

Usage:
  chimecli cluster updateCluster [flags]

Flags:
      --AzUuid string                                Required. the AZ's uuid
      --Body string                                  Optional json string for [Body]. the http post body
      --ClusterUuid string                           Required. the cluster's uuid
      --createClusterRequest.Arch string             the cluster's architecture, like x86_64, arm, ...
      --createClusterRequest.Description string      description for the cluster
      --createClusterRequest.HypervisorType string   the cluster's hypervisor type, like kvm (default), xen, ...
      --createClusterRequest.Name string             Required. the cluster's name
      --createClusterRequest.Type int                the cluster's type
  -h, --help  
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|body|[CreateClusterRequest](#schemacreateclusterrequest)|true|the http post body|

**命令行替代body参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|CreateClusterRequest.Arch|string|false|the cluster's architecture, like x86_64, arm, ...|
|CreateClusterRequest.Description|string|false|description for the cluster|
|CreateClusterRequest.HypervisorType|string|false|the cluster's hypervisor type, like kvm (default), xen, ...|
|CreateClusterRequest.Name|string|true|the cluster's name|
|CreateClusterRequest.Type|integer|false|the cluster's type|

#### 示例

命令行:

```
chimecli cluster updateCluster --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --createClusterRequest.Description 'cluster description' --createClusterRequest.Name 'test-cluster' 
```

返回:

```
{
  "requestId": "3bcdefae-d54a-4681-9004-fd163b997c90",
  "result": {
    "cluster": "ok"
  }
}
```

### 启用Cluster 

#### 命令原型

```
chimecli cluster enableCluster --help
This will enable a cluster

Usage:
  chimecli cluster enableCluster [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
  -h, --help                 help for enableCluster
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|

#### 示例

命令行:

```
chimecli cluster enableCluster --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
```

返回:

```
{
  "requestId": "43684ea3-d36b-479d-9793-4fa98fb8b214",
  "result": {
    "cluster": "ok"
  }
}
```

### 停用Cluster 

#### 命令原型

```
chimecli cluster disableCluster --help
This will disable a cluster

Usage:
  chimecli cluster disableCluster [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
  -h, --help                 help for disableCluster
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|

#### 示例

命令行:

```
chimecli cluster disableCluster --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
```

返回:

```
{
  "requestId": "0abc7fc0-eff4-45ec-870e-cb65a6abf2d7",
  "result": {
    "cluster": "ok"
  }
}
```

### 删除Cluster 


#### 命令原型

```
chimecli cluster deleteCluster --help
This will delete a cluster

Usage:
  chimecli cluster deleteCluster [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
  -h, --help                 help for deleteCluster
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|

#### 示例

命令行:

```
chimecli cluster deleteCluster --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
```

返回: 

```
{
  "requestId": "39aa34ae-2a76-4409-b96a-212802364638",
  "result": 1
}
```

## Host相关命令

### 查看Host列表

#### 命令原型

```
chimecli host listHost --help
This will show hosts

Usage:
  chimecli host listHost [flags]

Flags:
      --AzUuid string        Required. filter by the AZ's uuid
      --ClusterUuid string   Required. filter by the cluster's uuid
  -h, --help                 help for listHost
      --manage_ip string     filter by the host's management IP address
      --name string          filter by the 'name' field
      --order string         'asc' or 'desc' of sorting
      --page int             the page number of the results in paging
      --rack_name string     filter by the rack's name
      --size int             the page size of the results in paging
      --sort string          the field to be sorted by
      --state int            filter by the 'state' field
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|state|integer|false|filter by the 'state' field|
|rack_name|string|false|filter by the rack's name|
|manage_ip|string|false|filter by the host's management IP address|
|AzUuid|true|filter by the AZ's uuid|
|ClusterUuid|string|true|filter by the cluster's uuid|

#### 示例

命令行:

```
chimecli host listHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
```

返回:


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

#### 命令原型

```
chimecli host createHost --help
This will create a host

Usage:
  chimecli host createHost [flags]

Flags:
      --AzUuid string                           Required. the AZ's uuid
      --Body string                             Optional json string for [Body]. the http post body
      --ClusterUuid string                      Required. the cluster's uuid
      --createHostRequest.CpuRatio float32      the CPU's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical CPUs in the node.
      --createHostRequest.CpuReserved int       the reserverd CPU number, which will not be allocated to virtual machines.
      --createHostRequest.Description string    description for the host
      --createHostRequest.MemoryRatio float32   the memory's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical memory in the node.
      --createHostRequest.MemoryReserved int    the reserverd memory number, which will not be allocated to virtual machines.
      --createHostRequest.Uuid string           Required. the host's Uuid
  -h, --help     
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|body|[CreateHostRequest](#schemacreatehostrequest)|false|the http post body|

|Name|Type|Required|Description|
|---|---|---|---|
|cpu_ratio|float|false|the CPU's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical CPUs in the node.|
|description|string|false|description for the host|
|memory_ratio|float|false|the memory's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical memory in the node.|
|reserved_memory|integer|false|the reserverd memory number, which will not be allocated to virtual machines.|
|reserved_vcpus|integer|false|the reserverd CPU number, which will not be allocated to virtual machines.|
|uuid|string|true|the host's Uuid|

#### 示例

命令行:

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

返回:

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

#### 命令原型

```
chimecli host getHost --help
This will describe a host

Usage:
  chimecli host getHost [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --HostUuid string      Required. the host's uuid
  -h, --help                 help for getHost
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|HostUuid|string|true|the host's uuid|

#### 示例

命令行:

```
chimecli host getHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
```

返回:

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

#### 命令原型

```
chimecli host updateHost --help
This will update a host.

Usage:
  chimecli host updateHost [flags]

Flags:
      --AzUuid string                           Required. the AZ's uuid
      --Body string                             Optional json string for [Body]. the http post body
      --ClusterUuid string                      Required. the cluster's uuid
      --HostUuid string                         Required. the host's uuid
  -h, --help                                    help for updateHost
      --updateHostRequest.CpuRatio float32      the CPU's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical CPUs in the node.
      --updateHostRequest.CpuReserved int       the reserverd CPU number, which will not be allocated to virtual machines.
      --updateHostRequest.Description string    description for the host
      --updateHostRequest.MemoryRatio float32   the memory's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical memory in the node.
      --updateHostRequest.MemoryReserved int    the reserverd memory number, which will not be allocated to virtual machines.
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|HostUuid|string|true|the host's uuid|
|body|[UpdateHostRequest](#schemaupdatehostrequest)|true|the http post body|


|Name|Type|Required|Description|
|---|---|---|---|
|UpdateHostRequest.CpuRatio|float|false|the CPU's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical CPUs in the node.|
|UpdateHostRequest.Description|string|false|description for the host|
|UpdateHostRequest.MemoryRatio|float|false|the memory's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical memory in the node.|
|UpdateHostRequest.ReservedMemory|integer|false|the reserverd memory number, which will not be allocated to virtual machines.|
|UpdateHostRequest.ReservedVcpus|integer|false|the reserverd CPU number, which will not be allocated to virtual machines.|

#### 示例

命令行:
```
chimecli host updateHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a --updateHostRequest.CpuRatio 2.0 --updateHostRequest.CpuReserved 1 --updateHostRequest.MemoryRatio 2.0 --updateHostRequest.MemoryReserved 0
```

返回:

```
{
  "requestId": "c6ad8b13-9e99-4441-b3a0-ac6a1b611306",
  "result": {
    "host": "ok"
  }
}
```

### 删除Host

#### 命令原型

```
chimecli host deleteHost --help
This will delete a host

Usage:
  chimecli host deleteHost [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --HostUuid string      Required. the host's uuid
  -h, --help                 help for deleteHost
  ```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|HostUuid|string|true|the host's uuid|

#### 示例

命令行:

```
chimecli host deleteHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
```

返回:

```
{
  "requestId": "b363317b-6299-426c-8412-178aeaf42326",
  "result": 1
}
```

### 启用Host

#### 命令原型

```
chimecli host enableHost --help
This will enable a host

Usage:
  chimecli host enableHost [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --HostUuid string      Required. the host's uuid
  -h, --help                 help for enableHost
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|HostUuid|string|true|the host's uuid|

#### 示例

命令行:
```
chimecli host enableHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
```

返回:

```
{
  "requestId": "217560f4-41af-4c61-b61f-4998cbc2f07f",
  "result": {
    "host": "ok"
  }
}
```

### 停用Host 

#### 命令原型

```
chimecli host disableHost --help
This will disable a host

Usage:
  chimecli host disableHost [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --HostUuid string      Required. the host's uuid
  -h, --help                 help for disableHost
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|HostUuid|string|true|the host's uuid|

#### 示例

命令行:
```
chimecli host disableHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
```

返回:

```
{
  "requestId": "63514320-0abc-41ac-97ee-6b5df5fc7424",
  "result": {
    "host": "ok"
  }
}
```

### 挂起Host 

#### 命令原型

```
chimecli host suspendHost --help
This will suspend a host

Usage:
  chimecli host suspendHost [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --HostUuid string      Required. the host's uuid
  -h, --help                 help for suspendHost
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|HostUuid|string|true|the host's uuid|

#### 示例

命令行:
```
chimecli host suspendHost --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
```

返回:

```
{
  "requestId": "cc9484e2-7e7c-4aaa-82f1-8492f05a34ec",
  "result": {
    "host": "ok"
  }
}
```

### 查看物理节点列表

#### 命令原型

```
chimecli host listClient --help
This will show available clients

Usage:
  chimecli host listClient [flags]

Flags:
      --all int            retrieve all the clients
  -h, --help               help for listClient
      --manage_ip string   filter by the client's management IP address
      --name string        filter by the 'name' field
      --order string       'asc' or 'desc' of sorting
      --page int           the page number of the results in paging
      --rack_name string   filter by the rack's name
      --size int           the page size of the results in paging
      --sort string        the field to be sorted by
      --state int          filter by the 'state' field
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|state|integer|false|filter by the 'state' field|
|rack_name|string|false|filter by the rack's name|
|manage_ip|string|false|filter by the client's management IP address|
|all|integer|false|retrieve all the clients|

#### 示例

命令行:

```
chimecli host listClient
```

返回: 

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

#### 命令原型

```
chimecli instance_spec listInstanceSpec --help
list instance specifications

Usage:
  chimecli instance_spec listInstanceSpec [flags]

Flags:
  -h, --help           help for listInstanceSpec
      --name string    filter by the 'name' field
      --order string   'asc' or 'desc' of sorting
      --page int       the page number of the results in paging
      --size int       the page size of the results in paging
      --sort string    the field to be sorted by
      --type int       filter by the instance specification's type(0: shared, 1: dedicated)
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|type|integer|false|filter by the instance specification's type(0: shared, 1: dedicated)|

#### 示例

命令行:

```
chimecli instance_spec listInstanceSpec
```

返回:

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

#### 命令原型

```
chimecli instance_spec createInstanceSpec --help
create an instance specification

Usage:
  chimecli instance_spec createInstanceSpec [flags]

Flags:
      --Body string                                    Optional json string for [Body]. the http post body
      --createInstanceSpecRequest.Description string   description for the instance specification
      --createInstanceSpecRequest.Memory int           Required. the number of memory
      --createInstanceSpecRequest.Name string          Required. the instance specification's name
      --createInstanceSpecRequest.Type int             the instance specification's type, 0: shared resource, 1: dedicated resource
      --createInstanceSpecRequest.Vcpus int            Required. the number of vCPUs
  -h, --help     
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|body|[CreateInstanceSpecRequest](#schemacreateinstancespecrequest)|false|the http post body|

|Name|Type|Required|Description|
|---|---|---|---|
|CreateInstanceSpecRequest.Description|string|false|description for the instance specification|
|CreateInstanceSpecRequest.Memory|integer|true|the number of memory|
|CreateInstanceSpecRequest.Name|string|true|the instance specification's name|
|CreateInstanceSpecRequest.Type|integer|false|the instance specification's type, 0: shared resource, 1: dedicated resource|
|CreateInstanceSpecRequest.Vcpus|integer|true|the number of vCPUs|

#### 示例

命令行:

```
chimecli instance_spec createInstanceSpec --createInstanceSpecRequest.Name test-spec --createInstanceSpecRequest.Type 1 --createInstanceSpecRequest.Vcpus 1 --createInstanceSpecRequest.Memory 16777216
```

返回:

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

#### 命令原型

```
chimecli instance_spec getInstanceSpec --help
get an instance specification's detail information

Usage:
  chimecli instance_spec getInstanceSpec [flags]

Flags:
      --InstanceSpecUuid string   Required. the instance specification's uuid
  -h, --help                      help for getInstanceSpec
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|InstanceSpecUuid|string|true|the instance specification's uuid|

#### 示例

命令行:

```
chimecli instance_spec getInstanceSpec --InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c
```

返回:

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

#### 命令原型

```
chimecli instance_spec updateInstanceSpec --help
update an instance specification

Usage:
  chimecli instance_spec updateInstanceSpec [flags]

Flags:
      --Body string                                    Optional json string for [Body]. the http post body
      --InstanceSpecUuid string                        Required. the instance specification's uuid
      --createInstanceSpecRequest.Description string   description for the instance specification
      --createInstanceSpecRequest.Memory int           Required. the number of memory
      --createInstanceSpecRequest.Name string          Required. the instance specification's name
      --createInstanceSpecRequest.Type int             the instance specification's type, 0: shared resource, 1: dedicated resource
      --createInstanceSpecRequest.Vcpus int            Required. the number of vCPUs
  -h, --help                                           help for updateInstanceSpec
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|InstanceSpecUuid|string|true|the instance specification's uuid|
|body|[CreateInstanceSpecRequest](#schemacreateinstancespecrequest)|true|the http post body|

|Name|Type|Required|Description|
|---|---|---|---|
|CreateInstanceSpecRequest.Description|string|false|description for the instance specification|
|CreateInstanceSpecRequest.Memory|integer|true|the number of memory|
|CreateInstanceSpecRequest.Name|string|true|the instance specification's name|
|CreateInstanceSpecRequest.Type|integer|false|the instance specification's type, 0: shared resource, 1: dedicated resource|
|CreateInstanceSpecRequest.Vcpus|integer|true|the number of vCPUs|

#### 示例

命令行:

```
chimecli instance_spec updateInstanceSpec --InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c --createInstanceSpecRequest.Type 1 --createInstanceSpecRequest.Vcpus 2 --createInstanceSpecRequest.Name test-spec --createInstanceSpecRequest.Memory 16777216
```

返回:

```
{
  "requestId": "7c5d3460-83b5-48e8-84bd-a3a8b912c908",
  "result": {
    "instance_spec": "ok"
  }
}
```

### 删除计算规格

#### 命令原型

```
chimecli instance_spec deleteInstanceSpec --help
delete an instance specification

Usage:
  chimecli instance_spec deleteInstanceSpec [flags]

Flags:
      --InstanceSpecUuid string   Required. the instance specification's uuid
  -h, --help     
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|InstanceSpecUuid|string|true|the instance specification's uuid|

#### 示例

命令行:

```
chimecli instance_spec deleteInstanceSpec --InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c 
{"requestId":"1b24222f-0158-4d10-84c8-c478157e2465","result":1}
```

返回:

```
{
  "requestId": "1b24222f-0158-4d10-84c8-c478157e2465",
  "result": 1
}
```

### 关联计算规格到集群

#### 命令原型

```
chimecli instance_spec createClusterInstanceSpecRelation --help
register an instance specification to a cluster

Usage:
  chimecli instance_spec createClusterInstanceSpecRelation [flags]

Flags:
      --AzUuid string                                              Required. the AZ's uuid
      --Body string                                                Optional json string for [Body]. the http post body
      --ClusterUuid string                                         Required. the cluster's uuid
      --createClusterInstanceSpecRequest.InstanceSpecUuid string   Required. the instance specification's Uuid
  -h, --help                                                       help for createClusterInstanceSpecRelation
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|body|[CreateClusterInstanceSpecRequest](#schemacreateclusterinstancespecrequest)|false|the http post body|

|Name|Type|Required|Description|
|---|---|---|---|
|CreateClusterInstanceSpecRequest.InstanceSpecUuid|string|true|the instance specification's Uuid|

#### 示例

命令行:

```
chimecli instance_spec createClusterInstanceSpecRelation --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 --createClusterInstanceSpecRequest.InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c
```

返回: 

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

#### 命令原型

```
chimecli instance_spec deleteClusterInstanceSpecRelation --help
unregister an instance specification from a cluster

Usage:
  chimecli instance_spec deleteClusterInstanceSpecRelation [flags]

Flags:
      --AzUuid string             Required. the AZ's uuid
      --ClusterUuid string        Required. the cluster's uuid
      --InstanceSpecUuid string   Required. the instance specification's uuid
  -h, --help  
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|InstanceSpecUuid|string|true|the instance specification's uuid|

#### 示例

命令行:

```
chimecli instance_spec deleteClusterInstanceSpecRelation --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 --InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c
```

返回:

```
{
  "requestId": "ebf4f99d-37fb-45f2-935e-ba99052a3af7",
  "result": 1
}
```

### 查看集群的计算规格列表

#### 命令原型

```
chimecli instance_spec listClusterInstanceSpecRelation --help
list instance specifications registered in the cluster

Usage:
  chimecli instance_spec listClusterInstanceSpecRelation [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
  -h, --help                 help for listClusterInstanceSpecRelation
      --name string          filter by the 'name' field
      --order string         'asc' or 'desc' of sorting
      --page int             the page number of the results in paging
      --size int             the page size of the results in paging
      --sort string          the field to be sorted by
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|

#### 示例

命令行:

```
chimecli instance_spec listClusterInstanceSpecRelation --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774
```

返回:

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

#### 命令原型

```
chimecli volume_spec listVolumeSpec --help
list volume specifications

Usage:
  chimecli volume_spec listVolumeSpec [flags]

Flags:
  -h, --help                       help for listVolumeSpec
      --name string                filter by the 'name' field
      --order string               'asc' or 'desc' of sorting
      --page int                   the page number of the results in paging
      --size int                   the page size of the results in paging
      --sort string                the field to be sorted by
      --storage_pool_uuid string   filter by the storage pool's uuid
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|storage_pool_uuid|string|false|filter by the storage pool's uuid|

#### 示例

命令行:

```
chimecli volume_spec listVolumeSpec
```

返回:

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

#### 命令原型

```
chimecli volume_spec createVolumeSpec --help
create a volume specification

Usage:
  chimecli volume_spec createVolumeSpec [flags]

Flags:
      --Body string                                      Optional json string for [Body]. the http post body
      --createVolumeSpecRequest.Description string       description for the volume specification
      --createVolumeSpecRequest.MaxIops int              Required. 
      --createVolumeSpecRequest.MaxThroughput int        Required. the max throughput value of the volume specification
      --createVolumeSpecRequest.MinIops int              Required. the min iops value of the volume specification
      --createVolumeSpecRequest.MinThroughput int        Required. the min throughput value of the volume specification
      --createVolumeSpecRequest.Name string              Required. the volume specification's name
      --createVolumeSpecRequest.StepIops int             Required. the step iops value of the volume specification
      --createVolumeSpecRequest.StepThroughput int       Required. the step throughput value of the volume specification
      --createVolumeSpecRequest.StoragePoolUuid string   Required. the storage pool's Uuid
  -h, --help    
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|body|[CreateVolumeSpecRequest](#schemacreatevolumespecrequest)|false|the http post body|

|Name|Type|Required|Description|
|---|---|---|---|
|createVolumeSpecRequest.Description|string|false|description for the volume specification|
|createVolumeSpecRequest.MaxIops|integer|true|none|
|createVolumeSpecRequest.MaxThroughput|integer|true|the max throughput value of the volume specification|
|createVolumeSpecRequest.MinIops|integer|true|the min iops value of the volume specification|
|createVolumeSpecRequest.MinThroughput|integer|true|the min throughput value of the volume specification|
|createVolumeSpecRequest.Name|string|true|the volume specification's name|
|createVolumeSpecRequest.StepIops|integer|true|the step iops value of the volume specification|
|createVolumeSpecRequest.StepThroughput|integer|true|the step throughput value of the volume specification|
|createVolumeSpecRequest.StoragePoolUuid|string|true|the storage pool's Uuid|


#### 示例

命令行:

```
chimecli volume_spec createVolumeSpec --createVolumeSpecRequest.Name test-volume-spec --createVolumeSpecRequest.MaxIops 1000 --createVolumeSpecRequest.MinIops 500 --createVolumeSpecRequest.StepIops 10 --createVolumeSpecRequest.MaxThroughput 104857600 --createVolumeSpecRequest.MinThroughput 10485760 --createVolumeSpecRequest.StepThroughput 1048576 --createVolumeSpecRequest.StoragePoolUuid f5165a18-e6b3-42b4-8efc-ad496f318a0a
```

返回:

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

#### 命令原型

```
chimecli volume_spec getVolumeSpec --help
get a volume specification's detailed information

Usage:
  chimecli volume_spec getVolumeSpec [flags]

Flags:
      --VolumeSpecUuid string   Required. the volume specification's uuid
  -h, --help                    help for getVolumeSpec
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VolumeSpecUuid|string|true|the volume specification's uuid|

#### 示例

命令行:

```
chimecli volume_spec getVolumeSpec --VolumeSpecUuid c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa
```

返回:

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

#### 命令原型

```
chimecli volume_spec updateVolumeSpec --help
update volume specification

Usage:
  chimecli volume_spec updateVolumeSpec [flags]

Flags:
      --Body string                                      Optional json string for [Body]. the http post body
      --VolumeSpecUuid string                            Required. the volume specification's uuid
      --createVolumeSpecRequest.Description string       description for the volume specification
      --createVolumeSpecRequest.MaxIops int              Required. 
      --createVolumeSpecRequest.MaxThroughput int        Required. the max throughput value of the volume specification
      --createVolumeSpecRequest.MinIops int              Required. the min iops value of the volume specification
      --createVolumeSpecRequest.MinThroughput int        Required. the min throughput value of the volume specification
      --createVolumeSpecRequest.Name string              Required. the volume specification's name
      --createVolumeSpecRequest.StepIops int             Required. the step iops value of the volume specification
      --createVolumeSpecRequest.StepThroughput int       Required. the step throughput value of the volume specification
      --createVolumeSpecRequest.StoragePoolUuid string   Required. the storage pool's Uuid
  -h, --help     
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VolumeSpecUuid|string|true|the volume specification's uuid|
|body|[CreateVolumeSpecRequest](#schemacreatevolumespecrequest)|true|the http post body|

|Name|Type|Required|Description|
|---|---|---|---|
|createVolumeSpecRequest.Description|string|false|description for the volume specification|
|createVolumeSpecRequest.MaxIops|integer|true|none|
|createVolumeSpecRequest.MaxThroughput|integer|true|the max throughput value of the volume specification|
|createVolumeSpecRequest.MinIops|integer|true|the min iops value of the volume specification|
|createVolumeSpecRequest.MinThroughput|integer|true|the min throughput value of the volume specification|
|createVolumeSpecRequest.Name|string|true|the volume specification's name|
|createVolumeSpecRequest.StepIops|integer|true|the step iops value of the volume specification|
|createVolumeSpecRequest.StepThroughput|integer|true|the step throughput value of the volume specification|
|createVolumeSpecRequest.StoragePoolUuid|string|true|the storage pool's Uuid|

#### 示例

命令行:

```
chimecli volume_spec updateVolumeSpec \
  --VolumeSpecUuid c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa \
  --createVolumeSpecRequest.Name test-volume-spec \
  --createVolumeSpecRequest.MaxIops 1000 \
  --createVolumeSpecRequest.MinIops 500 \
  --createVolumeSpecRequest.StepIops 10 \
  --createVolumeSpecRequest.MaxThroughput 104857600 \
  --createVolumeSpecRequest.MinThroughput 10485760 \
  --createVolumeSpecRequest.StepThroughput 10485760 \
  --createVolumeSpecRequest.StoragePoolUuid f5165a18-e6b3-42b4-8efc-ad496f318a0a
```

返回: 

```
{
  "requestId": "6594c3cb-2a6a-4fcc-85d1-00746b29c980",
  "result": {
    "volume_spec": "ok"
  }
}
```

### 删除存储规格

#### 命令原型

```
chimecli volume_spec deleteVolumeSpec --help
delete a volume specification

Usage:
  chimecli volume_spec deleteVolumeSpec [flags]

Flags:
      --VolumeSpecUuid string   Required. the volume specification's uuid
  -h, --help                    help for deleteVolumeSpec
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VolumeSpecUuid|string|true|the volume specification's uuid|

#### 示例

命令行:

```
chimecli volume_spec deleteVolumeSpec --VolumeSpecUuid c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa
```

返回:

```
{
  "requestId": "7f7800e9-0057-44a5-9340-c46fda540dbe",
  "result": 1
}
```


### 关联存储规格到集群

#### 命令原型

```
chimecli volume_spec createClusterVolumeSpecRelation --help
register a volume specification to the cluster

Usage:
  chimecli volume_spec createClusterVolumeSpecRelation [flags]

Flags:
      --AzUuid string                                          Required. the AZ's uuid
      --Body string                                            Optional json string for [Body]. the http post body
      --ClusterUuid string                                     Required. the cluster's uuid
      --createClusterVolumeSpecRequest.VolumeSpecUuid string   Required. the volume specification's Uuid
  -h, --help    
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|body|[CreateClusterVolumeSpecRequest](#schemacreateclustervolumespecrequest)|false|the http post body|

|Name|Type|Required|Description|
|---|---|---|---|
|volume_spec_uuid|string|true|the volume specification's Uuid|

#### 示例

命令行:

```
chimecli volume_spec createClusterVolumeSpecRelation --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 --createClusterVolumeSpecRequest.VolumeSpecUuid c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa
```

返回:

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

#### 命令原型

```
chimecli volume_spec deleteClusterVolumeSpecRelation --help
unregister a volume specification from the cluster

Usage:
  chimecli volume_spec deleteClusterVolumeSpecRelation [flags]

Flags:
      --AzUuid string           Required. the AZ's uuid
      --ClusterUuid string      Required. the cluster's uuid
      --VolumeSpecUuid string   Required. the volume specification's uuid
  -h, --help  
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|VolumeSpecUuid|string|true|the volume specification's uuid|

#### 示例

命令行:

```
chimecli volume_spec deleteClusterVolumeSpecRelation \
  --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
  --VolumeSpecUuid c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa
```

返回:

```
{
  "requestId": "85e088bc-9b81-4172-b3ee-0f61da006106",
  "result": 1
}
```

### 查看集群的存储规格列表

#### 命令原型

```
chimecli volume_spec listClusterVolumeSpecRelation --help
list volume specifications

Usage:
  chimecli volume_spec listClusterVolumeSpecRelation [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
  -h, --help                 help for listClusterVolumeSpecRelation
      --name string          filter by the 'name' field
      --order string         'asc' or 'desc' of sorting
      --page int             the page number of the results in paging
      --size int             the page size of the results in paging
      --sort string          the field to be sorted by
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|

#### 示例

命令行:

```
chimecli volume_spec listClusterVolumeSpecRelation --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774
```

返回:

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

#### 命令原型

```
chimecli network listNetwork --help
list networks

Usage:
  chimecli network listNetwork [flags]

Flags:
      --AzUuid string           Required. filter by AZ's uuid
      --ClusterUuid string      Required. filter by the cluster's uuid
  -h, --help                    help for listNetwork
      --interface_name string   filter by network interface's name
      --name string             filter by the 'name' field
      --order string            'asc' or 'desc' of sorting
      --page int                the page number of the results in paging
      --size int                the page size of the results in paging
      --sort string             the field to be sorted by
      --state int               filter by the 'state' field
      --type int                filter by network type(0: classical network, 1:vlan, 2:vxlan)
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer(int64)|false|the page number of the results in paging|
|size|integer(int64)|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|state|integer(int64)|false|filter by the 'state' field|
|type|integer(int64)|false|filter by network type(0: classical network, 1:vlan, 2:vxlan)|
|interface_name|string|false|filter by network interface's name|
|AzUuid|string|true|filter by AZ's uuid|
|ClusterUuid|string|true|filter by the cluster's uuid|

#### 示例

命令行:

```
chimecli network listNetwork --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774
```

返回:

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

#### 命令原型

```
chimecli network createNetwork --help
create a network

Usage:
  chimecli network createNetwork [flags]

Flags:
      --AzUuid string                               Required. the AZ's uuid
      --Body string                                 Optional json string for [Body]. the http post body
      --ClusterUuid string                          Required. the cluster's uuid
      --createNetworkRequest.Description string     description for the network
      --createNetworkRequest.InterfaceName string   Required. the unified interface name which the network uses in the node
      --createNetworkRequest.Name string            Required. the network's name
      --createNetworkRequest.Type int               the network's type, can be: classical, vlan and vxlan
  -h, --help    
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|body|[CreateNetworkRequest](#schemacreatenetworkrequest)|false|the http post body|

|Name|Type|Required|Description|
|---|---|---|---|
|createNetworkRequest.Description|string|false|description for the network|
|createNetworkRequest.InterfaceName|string|true|the unified interface name which the network uses in the node|
|createNetworkRequest.Name|string|true|the network's name|
|createNetworkRequest.Type|integer|false|the network's type, can be: classical, vlan and vxlan|

#### 示例

命令行:

```
chimecli network createNetwork \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
  --createNetworkRequest.Type 0 \
  --createNetworkRequest.Name br1 \
  --createNetworkRequest.InterfaceName ens224
```

返回: 

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

#### 命令原型

```
chimecli network getNetwork --help
get network's detailed information

Usage:
  chimecli network getNetwork [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --NetworkUuid string   Required. the network's uuid
  -h, --help                 help for getNetwork
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|NetworkUuid|string|true|the network's uuid|

#### 示例

命令行:

```
chimecli network getNetwork --NetworkUuid 52899f98-3963-4ae0-abde-2ea72e27f2b6
```

返回:

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

#### 命令原型

```
chimecli network updateNetwork --help
update a network

Usage:
  chimecli network updateNetwork [flags]

Flags:
      --AzUuid string                             Required. the AZ's uuid
      --Body string                               Optional json string for [Body]. the http post body
      --ClusterUuid string                        Required. the cluster's uuid
      --NetworkUuid string                        Required. the network's uuid
  -h, --help                                      help for updateNetwork
      --updateNetworkRequest.Description string   description for the network
      --updateNetworkRequest.Name string          Required. the network's name
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|NetworkUuid|string|true|the network's uuid|
|body|[UpdateNetworkRequest](#schemaupdatenetworkrequest)|false|the http post body|

|Name|Type|Required|Description|
|---|---|---|---|
|updateNetworkRequest.Description|string|false|description for the network|
|updateNetworkRequest.Name|string|true|the network's name|

#### 示例

命令行:

```
chimecli network updateNetwork --NetworkUuid 52899f98-3963-4ae0-abde-2ea72e27f2b6 --updateNetworkRequest.Name br1 --updateNetworkRequest.Description br1-network
```

返回:

```
{
  "requestId": "484f5728-ee8f-44a1-a1df-4b156b9d58a5",
  "result": {
    "network": "ok"
  }
}
```

### 删除网络

#### 命令原型

```
chimecli network deleteNetwork --help
delete a network

Usage:
  chimecli network deleteNetwork [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --NetworkUuid string   Required. the network's uuid
  -h, --help 
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|NetworkUuid|string|true|the network's uuid|

#### 示例

命令行:

```
chimecli network deleteNetwork --NetworkUuid 52899f98-3963-4ae0-abde-2ea72e27f2b6
```

返回:

```
{
  "requestId": "2594ebfe-cc1c-44a2-965c-cad7bc9fbd55",
  "result": 1
}
```

### 获取子网列表

#### 命令原型

```
chimecli network listSubnet --help
list subnets

Usage:
  chimecli network listSubnet [flags]

Flags:
      --AzUuid string        Required. filter by AZ's uuid
      --ClusterUuid string   Required. filter by cluster's uuid
      --NetworkUuid string   Required. filter by network's uuid
  -h, --help                 help for listSubnet
      --name string          filter by the 'name' field
      --order string         'asc' or 'desc' of sorting
      --page int             the page number of the results in paging
      --size int             the page size of the results in paging
      --sort string          the field to be sorted by
      --state int            filter by the 'state' field
      --type int             filter by subnet's type
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|state|integer|false|filter by the 'state' field|
|type|integer|false|filter by subnet's type|
|AzUuid|string|true|filter by AZ's uuid|
|ClusterUuid|string|true|filter by cluster's uuid|
|NetworkUuid|string|true|filter by network's uuid|

#### 示例

命令行:

```
chimecli network listSubnet \
  --NetworkUuid f2a515db-7699-4970-b13c-a8ea9840f62e \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774
```

返回:

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

#### 命令原型

```
chimecli network createSubnet --help
create a subnet

Usage:
  chimecli network createSubnet [flags]

Flags:
      --AzUuid string                            Required. the AZ's uuid
      --Body string                              Optional json string for [Body]. the http post body
      --ClusterUuid string                       Required. the cluster's uuid
      --NetworkUuid string                       Required. the network's uuid
      --createSubnetRequest.CIDR string          Required. the CIDR value, e.g. 192.168.231.1/24
      --createSubnetRequest.Description string   description for the subnet
      --createSubnetRequest.Gateway string       the gateway of the subnet
      --createSubnetRequest.Name string          Required. the subnet's name
      --createSubnetRequest.ReservedIps string   the reserved ips inside the subnet, which will not be assigned to virtual machines
  -h, --help  
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|NetworkUuid|string|true|the network's uuid|
|body|[CreateSubnetRequest](#schemacreatesubnetrequest)|false|the http post body|

|Name|Type|Required|Description|
|---|---|---|---|
|createSubnetRequest.Cidr|string|true|the CIDR value, e.g. 192.168.231.1/24|
|createSubnetRequest.Description|string|false|description for the subnet|
|createSubnetRequest.Gateway|string|false|the gateway of the subnet|
|createSubnetRequest.Name|string|true|the subnet's name|
|createSubnetRequest.ReservedIps|string|false|the reserved ips inside the subnet, which will not be assigned to virtual machines|

#### 示例

命令行:

```
chimecli network createSubnet \
  --NetworkUuid f2a515db-7699-4970-b13c-a8ea9840f62e \
  --createSubnetRequest.CIDR 192.168.231.200/30 \
  --createSubnetRequest.Name subnet2
```

返回:

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

#### 命令原型

```
chimecli network getSubnet --help
get a subnet's detailed information

Usage:
  chimecli network getSubnet [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --NetworkUuid string   Required. the network's uuid
      --SubnetUuid string    Required. the subnet's uuid
  -h, --help  
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|NetworkUuid|string|true|the network's uuid|
|SubnetUuid|string|true|the subnet's uuid|

#### 示例

命令行:

```
chimecli network getSubnet --SubnetUuid fed410bf-da50-490f-a045-314b08dc8ad5
```

返回:

```
{
  "requestId": "3e6498f2-3a89-403d-b3d5-f03063f921a9",
  "result": {
    "subnet": {
      "cidr": "192.168.231.200/30",
      "created_at": "2024-04-18T04:28:29Z",
      "description": "",
      "gateway": "192.168.231.200",
      "name": "subnet2",
      "network_name": "br1",
      "network_uuid": "f2a515db-7699-4970-b13c-a8ea9840f62e",
      "reserved_ips": "",
      "state": 1,
      "type": 0,
      "uuid": "fed410bf-da50-490f-a045-314b08dc8ad5"
    }
  }
}
```

### 更新子网

#### 命令原型

```
chimecli network updateSubnet --help
update a subnet

Usage:
  chimecli network updateSubnet [flags]

Flags:
      --AzUuid string                            Required. the AZ's uuid
      --Body string                              Optional json string for [Body]. the http post body
      --ClusterUuid string                       Required. the cluster's uuid
      --NetworkUuid string                       Required. the network's uuid
      --SubnetUuid string                        Required. the subnet's uuid
      --createSubnetRequest.CIDR string          Required. the CIDR value, e.g. 192.168.231.1/24
      --createSubnetRequest.Description string   description for the subnet
      --createSubnetRequest.Gateway string       the gateway of the subnet
      --createSubnetRequest.Name string          Required. the subnet's name
      --createSubnetRequest.ReservedIps string   the reserved ips inside the subnet, which will not be assigned to virtual machines
  -h, --help   
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|NetworkUuid|string|true|the network's uuid|
|SubnetUuid|string|true|the subnet's uuid|
|body|[CreateSubnetRequest](#schemacreatesubnetrequest)|false|the http post body|

|Name|Type|Required|Description|
|---|---|---|---|
|createSubnetRequest.Cidr|string|true|the CIDR value, e.g. 192.168.231.1/24|
|createSubnetRequest.Description|string|false|description for the subnet|
|createSubnetRequest.Gateway|string|false|the gateway of the subnet|
|createSubnetRequest.Name|string|true|the subnet's name|
|createSubnetRequest.ReservedIps|string|false|the reserved ips inside the subnet, which will not be assigned to virtual machines|

#### 示例

命令行:

```
chimecli network updateSubnet \
  --SubnetUuid fed410bf-da50-490f-a045-314b08dc8ad5 \
  --NetworkUuid f2a515db-7699-4970-b13c-a8ea9840f62e \
  --createSubnetRequest.CIDR 192.168.231.200/32 \
  --createSubnetRequest.ReservedIps 192.168.231.128,192.168.231.158 \
  --createSubnetRequest.Name subnet2
```

返回:

```
{
  "requestId": "4e5ff592-6c71-426f-a9ed-6691972d7443",
  "result": {
    "subnet": "ok"
  }
}
```

### 删除子网

#### 命令原型

```
chimecli network deleteSubnet --help
delete a subnet

Usage:
  chimecli network deleteSubnet [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --NetworkUuid string   Required. the network's uuid
      --SubnetUuid string    Required. the subnet's uuid
  -h, --help  
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|NetworkUuid|string|true|the network's uuid|
|SubnetUuid|string|true|the subnet's uuid|

#### 示例

命令行:

```
chimecli network deleteSubnet --SubnetUuid fed410bf-da50-490f-a045-314b08dc8ad5
```

返回:

```
{
  "requestId": "e5a8a943-cabc-4959-ad6d-eac97f384839",
  "result": 1
}
```

## 存储池相关命令

### 获取存储池列表

#### 命令原型

#### 参数列表

#### 示例

命令行:
```
chimecli storage_pool listStoragePool --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774
```

```
{
  "requestId": "1b5d3610-baae-40ec-834f-18a690b91366",
  "result": {
    "elements": [
      {
        "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
        "backend_path": "/hyperc/backend",
        "cluster_name": "Default",
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2023-06-25T19:10:18Z",
        "description": "local storage pool2aa",
        "image_cache_path": "/hyperc/cache",
        "name": "Local Storage Pool",
        "physical_size": 0,
        "reserved_size": 0,
        "state": 1,
        "total_size": 0,
        "type": 0,
        "used_size": 0,
        "uuid": "f5165a18-e6b3-42b4-8efc-ad496f318a0a"
      }
    ],
    "size": 1,
    "total": 1
  }
}
```

### 新建存储池

#### 命令原型

#### 参数列表

#### 示例

命令行:
```
chimecli storage_pool createStoragePool --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 --createStoragePoolRequest.BackendPath /chime/backend --createStoragePoolRequest.ImageCachePath /chime/cache --createStoragePoolRequest.Name new-storagepool --createStoragePoolRequest.PhysicalSize 1048576000 --createStoragePoolRequest.ReservedSize 0 --createStoragePoolRequest.SizeRatio 2 --createStoragePoolRequest.Type 0
```

```
{
  "requestId": "6b511a24-c98f-4619-99cf-21adba3063f7",
  "result": {
    "storage_pool": {
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "backend_path": "/chime/backend",
      "cluster_name": "",
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-04-18T07:29:07.754159689Z",
      "description": "",
      "image_cache_path": "/chime/cache",
      "name": "new-storagepool",
      "physical_size": 1048576000,
      "reserved_size": 0,
      "state": 1,
      "total_size": 2097152000,
      "type": 0,
      "used_size": 0,
      "uuid": "97329a52-44c4-44ac-af4f-fb45c95b618b"
    }
  }
}
```

### 查看存储池

#### 命令原型

#### 参数列表

#### 示例

命令行:
```
chimecli storage_pool getStoragePool --StoragePoolUuid 97329a52-44c4-44ac-af4f-fb45c95b618b
```

```
{
  "requestId": "f50f9372-da7d-41c5-8cc9-713a8dcd492c",
  "result": {
    "storage_pool": {
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "backend_path": "/chime/backend",
      "cluster_name": "Default",
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-04-18T07:29:08Z",
      "description": "",
      "image_cache_path": "/chime/cache",
      "name": "new-storagepool",
      "physical_size": 1048576000,
      "reserved_size": 0,
      "state": 1,
      "total_size": 2097152000,
      "type": 0,
      "used_size": 0,
      "uuid": "97329a52-44c4-44ac-af4f-fb45c95b618b"
    }
  }
}
```
### 更新存储池

#### 命令原型

#### 参数列表

#### 示例

命令行:
```
chimecli storage_pool updateStoragePool --StoragePoolUuid 97329a52-44c4-44ac-af4f-fb45c95b618b --createStoragePoolRequest.BackendPath /chime/backend1 --createStoragePoolRequest.ImageCachePath /chime/cache --createStoragePoolRequest.PhysicalSize 104857600 --createStoragePoolRequest.SizeRatio 3 --createStoragePoolRequest.Type 0 --createStoragePoolRequest.Name new-storagepool
```

```
{
  "requestId": "d42d4a0b-f3e9-450e-a95e-d9d7cffd9a91",
  "result": {
    "storage_pool": "ok"
  }
}
```

### 删除存储池

#### 命令原型

#### 参数列表

#### 示例

命令行:
```
chimecli storage_pool deleteStoragePool --StoragePoolUuid 97329a52-44c4-44ac-af4f-fb45c95b618b
```

```
{
  "requestId": "a76eed93-e64f-4ce7-8bad-acd2e1fd52fa",
  "result": 1
}
```

## 镜像相关命令

### 镜像列表

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli image listImage
```

```
{
  "requestId": "452bc768-61e6-4885-ac74-74f481a920c8",
  "result": {
    "elements": [
      {
        "boot_type": "bios",
        "bucket_name": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
        "bucket_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
        "created_at": "2023-10-12T08:05:25Z",
        "description": "aaaaa",
        "format": "qcow2",
        "install_url": "file:///root/images/centos7_cloudinit.qcow2",
        "name": "centos_admin",
        "operation": "",
        "os_arch": "x86_64",
        "os_detail": "CentOS 7.x",
        "os_type": "CentOS",
        "shared": 0,
        "state": 1,
        "uuid": "af9f5fe3-127a-43be-9a8b-acc6f50d263c"
      }
    ],
    "size": 1,
    "total": 1
  }
}
```

### 新建公有镜像

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli image createPublicImage \
    --createImageRequest.Format qcow2 \
    --createImageRequest.Name centos \
    --createImageRequest.OsType CentOS \
    --createImageRequest.OsDetail 'CentOS 8.x' \
    --createImageRequest.InstallUrl file:///root/images/centos7_cloudinit.qcow2
```

```
{
  "requestId": "a25c2320-7a41-44f8-a782-2f062ba41b6b",
  "result": {
    "image": {
      "boot_type": "",
      "bucket_name": "",
      "bucket_uuid": "public",
      "created_at": "0001-01-01T00:00:00Z",
      "description": "",
      "format": "qcow2",
      "install_url": "file:///root/images/centos7_cloudinit.qcow2",
      "name": "centos",
      "operation": "",
      "os_arch": "",
      "os_detail": "CentOS 8.x",
      "os_type": "CentOS",
      "shared": 0,
      "state": 0,
      "uuid": "fb11078f-8af8-4247-adfe-295459f29646"
    }
  }
}
```

### 新建私有镜像

#### 命令原型

#### 参数列表

#### 示例

命令行:
```
chimecli image createUserImage \
    --createImageRequest.Format qcow2 \
    --createImageRequest.Name centos \
    --createImageRequest.OsType CentOS \
    --createImageRequest.OsDetail 'CentOS 8.x' \
    --createImageRequest.InstallUrl file:///root/images/centos7_cloudinit.qcow2
```

```
{
  "requestId": "2054dce8-aa03-4734-8989-547ca6d4d2a5",
  "result": {
    "image": {
      "boot_type": "",
      "bucket_name": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
      "bucket_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
      "created_at": "0001-01-01T00:00:00Z",
      "description": "",
      "format": "qcow2",
      "install_url": "file:///root/images/centos7_cloudinit.qcow2",
      "name": "centos",
      "operation": "",
      "os_arch": "",
      "os_detail": "CentOS 8.x",
      "os_type": "CentOS",
      "shared": 0,
      "state": 0,
      "uuid": "2054dce8-aa03-4734-8989-547ca6d4d2a5"
    }
  }
}
```

### 查询镜像

#### 命令原型

#### 参数列表

#### 示例

命令行:
```
chimecli image getImage --ImageUuid fb11078f-8af8-4247-adfe-295459f29646
```

```
{
  "requestId": "e2b6cff1-6677-4ccb-b239-adeb26e6d7d0",
  "result": {
    "image": {
      "boot_type": "",
      "bucket_name": "public",
      "bucket_uuid": "public",
      "created_at": "2024-04-18T08:44:42Z",
      "description": "",
      "format": "qcow2",
      "install_url": "file:///root/images/centos7_cloudinit.qcow2",
      "name": "centos",
      "operation": "",
      "os_arch": "",
      "os_detail": "CentOS 8.x",
      "os_type": "CentOS",
      "shared": 0,
      "state": 1,
      "uuid": "fb11078f-8af8-4247-adfe-295459f29646"
    }
  }
}
```

### 更新镜像

#### 命令原型

#### 参数列表

#### 示例

命令行:
```
chimecli image updateImage \
    --ImageUuid fb11078f-8af8-4247-adfe-295459f29646 \
    --updateImageRequest.Name centos-test
```

```
{
  "requestId": "136bdfad-2ee1-49fd-a754-c2b5c33876a2",
  "result": {
    "image": "ok"
  }
}
```

### 删除镜像

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli image deleteImage --ImageUuid fb11078f-8af8-4247-adfe-295459f29646
```

```
{
  "requestId": "8c6fbd16-83a3-47f7-a10f-b0f5ab76f74c",
  "result": 0
}
```

### 镜像源列表

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli image listImageBucket
```

```
{
  "requestId": "c4c019ab-cd37-4c43-b57b-0a4634f1e100",
  "result": {
    "elements": [
      {
        "bucket_name": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
        "created_at": "2023-10-12T08:05:25Z",
        "description": "",
        "image_count": 1,
        "name": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
        "state": 1,
        "type": 1,
        "user_name": "admin",
        "uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c"
      },
      {
        "bucket_name": "39a6b9e4-bda8-4d39-ae51-1b270a796b36",
        "created_at": "2023-10-09T18:51:18Z",
        "description": "",
        "image_count": 3,
        "name": "39a6b9e4-bda8-4d39-ae51-1b270a796b36",
        "state": 1,
        "type": 1,
        "user_name": "user",
        "uuid": "39a6b9e4-bda8-4d39-ae51-1b270a796b36"
      },
      {
        "bucket_name": "public",
        "created_at": "2023-06-19T02:27:36Z",
        "description": "public image bucket",
        "image_count": 6,
        "name": "public",
        "state": 1,
        "type": 0,
        "user_name": "",
        "uuid": "public"
      }
    ],
    "size": 3,
    "total": 3
  }
}
```

### 查看镜像源

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli image getImageBucket --ImageBucketUuid 9c15f4cb-5f6d-4e45-818f-a4315c54240c
```

```
{
  "requestId": "4f7d20b4-0051-48ea-949b-e8acae9d40ee",
  "result": {
    "imagebucket": {
      "bucket_name": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
      "created_at": "2023-10-12T08:05:25Z",
      "description": "",
      "image_count": 1,
      "name": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
      "state": 1,
      "type": 1,
      "user_name": "admin",
      "uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c"
    }
  }
}
```

## 报警相关命令

### 报警列表

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli alert listAlert
```

```
{
  "requestId": "2b5b041d-686a-4873-b5eb-49ea2a9b9632",
  "result": {
    "elements": [
      {
        "comment": "",
        "created_at": "2024-04-18T09:16:00Z",
        "description": "host name: host-a428263d, cpu usage: 0.86",
        "name": "Host CPU Usage Larger Than 50%",
        "priority": 1,
        "rule_uuid": "62deb6e7-6d56-11ee-b5ce-000c29dc11fc",
        "severity": 1,
        "state": 0,
        "uuid": "07c8983f-f467-4223-b101-aa820585444a"
      },
      {
        "comment": "",
        "created_at": "2024-04-18T09:16:00Z",
        "description": "host name: host-a428263d, memory usage: 21.43",
        "name": "Host Memory Usage Larger Than 80%",
        "priority": 2,
        "rule_uuid": "bca66fad-6d56-11ee-b5ce-000c29dc11fc",
        "severity": 2,
        "state": 0,
        "uuid": "37469f5c-c686-4977-bbc9-424788d8f6fe"
      },
      {
        "comment": "",
        "created_at": "2024-04-18T09:15:00Z",
        "description": "host name: host-a428263d, cpu usage: 0.73",
        "name": "Host CPU Usage Larger Than 50%",
        "priority": 1,
        "rule_uuid": "62deb6e7-6d56-11ee-b5ce-000c29dc11fc",
        "severity": 1,
        "state": 0,
        "uuid": "2e8bbe77-5864-44a2-921c-e1ee88ed6e23"
      },
      {
        "comment": "",
        "created_at": "2024-04-18T09:15:00Z",
        "description": "host name: host-a428263d, memory usage: 21.43",
        "name": "Host Memory Usage Larger Than 80%",
        "priority": 2,
        "rule_uuid": "bca66fad-6d56-11ee-b5ce-000c29dc11fc",
        "severity": 2,
        "state": 0,
        "uuid": "3a7de398-f1e5-4e22-9180-d0b38280de5d"
      },
      {
        "comment": "",
        "created_at": "2024-04-18T09:14:00Z",
        "description": "host name: host-a428263d, cpu usage: 0.67",
        "name": "Host CPU Usage Larger Than 50%",
        "priority": 1,
        "rule_uuid": "62deb6e7-6d56-11ee-b5ce-000c29dc11fc",
        "severity": 1,
        "state": 0,
        "uuid": "a5004518-afd0-42a4-92b8-c49cc76feacb"
      },
      {
        "comment": "",
        "created_at": "2024-04-18T09:14:00Z",
        "description": "host name: host-a428263d, memory usage: 21.43",
        "name": "Host Memory Usage Larger Than 80%",
        "priority": 2,
        "rule_uuid": "bca66fad-6d56-11ee-b5ce-000c29dc11fc",
        "severity": 2,
        "state": 0,
        "uuid": "6e949a1d-fe8f-4834-bdb6-d696d0bd4f0f"
      },
      {
        "comment": "",
        "created_at": "2024-04-18T09:13:00Z",
        "description": "host name: host-a428263d, cpu usage: 0.63",
        "name": "Host CPU Usage Larger Than 50%",
        "priority": 1,
        "rule_uuid": "62deb6e7-6d56-11ee-b5ce-000c29dc11fc",
        "severity": 1,
        "state": 0,
        "uuid": "723729cd-9911-452a-9afb-97540fdc7252"
      },
      {
        "comment": "",
        "created_at": "2024-04-18T09:13:00Z",
        "description": "host name: host-a428263d, memory usage: 21.43",
        "name": "Host Memory Usage Larger Than 80%",
        "priority": 2,
        "rule_uuid": "bca66fad-6d56-11ee-b5ce-000c29dc11fc",
        "severity": 2,
        "state": 0,
        "uuid": "3c7e8f49-f0f9-44ee-86b5-ea9dc4ba9730"
      },
      {
        "comment": "",
        "created_at": "2024-04-18T09:12:00Z",
        "description": "host name: host-a428263d, memory usage: 21.43",
        "name": "Host Memory Usage Larger Than 80%",
        "priority": 2,
        "rule_uuid": "bca66fad-6d56-11ee-b5ce-000c29dc11fc",
        "severity": 2,
        "state": 0,
        "uuid": "e1be82ff-6067-4644-8e40-dac1a7b9b86e"
      },
      {
        "comment": "",
        "created_at": "2024-04-18T09:12:00Z",
        "description": "host name: host-a428263d, cpu usage: 0.63",
        "name": "Host CPU Usage Larger Than 50%",
        "priority": 1,
        "rule_uuid": "62deb6e7-6d56-11ee-b5ce-000c29dc11fc",
        "severity": 1,
        "state": 0,
        "uuid": "c24f4240-6e5e-418b-911f-fa46fe173888"
      }
    ],
    "size": 10,
    "total": 28219
  }
}
```

### 查看报警详情

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli alert getAlert --AlertUuid e1be82ff-6067-4644-8e40-dac1a7b9b86e
```

```
{
  "requestId": "f2cdbe5d-60a3-4f6b-bdc6-2b07e389454f",
  "result": {
    "alert": {
      "comment": "",
      "created_at": "2024-04-18T09:12:00Z",
      "description": "host name: host-a428263d, memory usage: 21.43",
      "name": "Host Memory Usage Larger Than 80%",
      "priority": 2,
      "rule_uuid": "bca66fad-6d56-11ee-b5ce-000c29dc11fc",
      "severity": 2,
      "state": 0,
      "uuid": "e1be82ff-6067-4644-8e40-dac1a7b9b86e"
    }
  }
}
```

### 接受报警

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli alert acceptAlert --AlertUuid e1be82ff-6067-4644-8e40-dac1a7b9b86e --acceptAlertRequest.Comment "accepted"
```

```
{
  "requestId": "799f65c8-dd20-4b4c-94f9-0cdc92bd8119",
  "result": "ok"
}
```

### 删除报警

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli alert deleteAlert --AlertUuid c24f4240-6e5e-418b-911f-fa46fe173888
```

```
{
  "requestId": "9a59e8a7-4c9f-4a8b-9c4f-1676c057274a",
  "result": 0
}
```

### 查看报警规则列表

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli alert listAlertRule
```

```
{
  "requestId": "e95e66ce-538a-43ee-9162-9ceb6a1cb083",
  "result": {
    "elements": [
      {
        "aggregate": "3",
        "created_at": "2023-10-18T05:33:22Z",
        "cron": "0 */1 * * * *",
        "field": "vm_uuid|used_avg",
        "match": "vm_metrics_aggr|used_avg|>|10.0",
        "name": "Instance Memory Usage Larger Than 80%",
        "priority": 2,
        "severity": 2,
        "state": 1,
        "template": "vm uuid: {{vm_uuid}}, memory usage: {{used_avg}}",
        "uuid": "da08b82e-6d77-11ee-b5ce-000c29dc11fc"
      },
      {
        "aggregate": "3",
        "created_at": "2023-10-18T01:36:19Z",
        "cron": "0 */1 * * * *",
        "field": "host|used_avg",
        "match": "host_metrics_aggr|used_avg|>|10.0",
        "name": "Host Memory Usage Larger Than 80%",
        "priority": 2,
        "severity": 2,
        "state": 1,
        "template": "host name: {{host}}, memory usage: {{used_avg}}",
        "uuid": "bca66fad-6d56-11ee-b5ce-000c29dc11fc"
      },
      {
        "aggregate": "3",
        "created_at": "2023-10-18T01:34:01Z",
        "cron": "0 */1 * * * *",
        "field": "host|total_avg",
        "match": "host_metrics_aggr|total_avg|>|10.0",
        "name": "Host CPU Usage Larger Than 80%",
        "priority": 2,
        "severity": 2,
        "state": 1,
        "template": "host name: {{host}}, cpu usage: {{total_avg}}",
        "uuid": "6a7730cf-6d56-11ee-b5ce-000c29dc11fc"
      },
      {
        "aggregate": "3",
        "created_at": "2023-10-18T01:33:48Z",
        "cron": "0 */1 * * * *",
        "field": "host|total_avg",
        "match": "host_metrics_aggr|total_avg|>|0.3",
        "name": "Host CPU Usage Larger Than 50%",
        "priority": 1,
        "severity": 1,
        "state": 1,
        "template": "host name: {{host}}, cpu usage: {{total_avg}}",
        "uuid": "62deb6e7-6d56-11ee-b5ce-000c29dc11fc"
      }
    ],
    "size": 4,
    "total": 4
  }
}
```

### 查看报警规则详情

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli alert getAlertRule --RuleUuid 62deb6e7-6d56-11ee-b5ce-000c29dc11fc
```

```
{
  "requestId": "813dd88f-7b09-4e27-8149-039e94c1f008",
  "result": {
    "alert": {
      "aggregate": "3",
      "created_at": "2023-10-18T01:33:48Z",
      "cron": "0 */1 * * * *",
      "field": "host|total_avg",
      "match": "host_metrics_aggr|total_avg|>|0.3",
      "name": "Host CPU Usage Larger Than 50%",
      "priority": 1,
      "severity": 1,
      "state": 1,
      "template": "host name: {{host}}, cpu usage: {{total_avg}}",
      "uuid": "62deb6e7-6d56-11ee-b5ce-000c29dc11fc"
    }
  }
}
```

## 虚拟机操作相关命令

### 虚拟机列表

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli compute listVm --state 1
```

```
{
  "requestId": "dd66fcff-67e4-4d9c-abd2-410bc8f558b6",
  "result": {
    "elements": [
      {
        "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
        "boot_type": "",
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2024-04-18T13:41:51Z",
        "description": "",
        "host_ip": "",
        "host_name": "",
        "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
        "hyper_type": "",
        "image_name": "",
        "memory": 1073741824,
        "name": "vm1",
        "nics": [],
        "operation": "",
        "os_arch": "",
        "os_detail": "",
        "os_type": "",
        "spec_type": 0,
        "state": 1,
        "tags": null,
        "uuid": "7a46560b-c00b-4acc-a677-4dcfbfa11a77",
        "vcpus": 1,
        "volumes": []
      }
    ],
    "size": 1,
    "total": 1
  }
}
```

### 创建虚拟机

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli compute createVm --Body  \
'{  
  "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865", 
  "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774", 
  "instance_spec_uuid": "cd047e9d-2720-4397-84e5-777e4a39a531", 
  "name": "dennis12", 
  "volumes": [ 
    { 
      "name": "rootvolume", 
      "size": 10, 
      "volume_spec_uuid": "38112d5c-7f13-438a-aec5-d14de51bd30f", 
      "image_uuid": "993933dc-f0e2-4bd6-966f-0b4872ea93cc", 
      "root": 1 
    }, 
    { 
      "name": "datavolume", 
      "size": 20, 
      "volume_spec_uuid": "38112d5c-7f13-438a-aec5-d14de51bd30f", 
      "root": 0 
    } 
  ], 
  "nics": [ 
    { 
      "name": "rootnic", 
      "subnet_uuid": "e73efdf7-d232-4556-ba95-3851100a47b7" 
    } 
  ] 
}'
```

```
{
  "requestId": "e8bbddd9-2520-4d46-81ea-720e48bad3b1",
  "result": {
    "vm": {
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "boot_type": "",
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "0001-01-01T00:00:00Z",
      "description": "",
      "host_ip": "",
      "host_name": "",
      "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
      "hyper_type": "kvm",
      "image_name": "",
      "memory": 1073741824,
      "name": "dennis12",
      "nics": [
        {
          "attached_vms": [],
          "created_at": "0001-01-01T00:00:00Z",
          "description": "",
          "gateway": "",
          "ip": "",
          "mac": "",
          "name": "rootnic",
          "netmask": "",
          "network_name": "br1",
          "network_type": 0,
          "operation": "",
          "primary": 0,
          "state": 0,
          "subnet_cidr": "",
          "subnet_name": "",
          "subnet_uuid": "e73efdf7-d232-4556-ba95-3851100a47b7",
          "uuid": "a88d3234-f2e7-4055-9f6a-e961d8a23328"
        }
      ],
      "operation": "",
      "os_arch": "",
      "os_detail": "",
      "os_type": "",
      "spec_type": 0,
      "state": 0,
      "tags": null,
      "uuid": "4be21239-293c-4989-b637-4df104f17caf",
      "vcpus": 1,
      "volumes": [
        {
          "attached_vms": [],
          "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
          "cdrom": 0,
          "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
          "created_at": "0001-01-01T00:00:00Z",
          "description": "",
          "host_ip": "",
          "host_name": "",
          "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
          "image_name": "",
          "image_uuid": "993933dc-f0e2-4bd6-966f-0b4872ea93cc",
          "iops": 500,
          "name": "rootvolume",
          "operation": "e8bbddd9-2520-4d46-81ea-720e48bad3b1",
          "parent_version": 0,
          "root": 1,
          "size": 10,
          "snapshot_count": 0,
          "snapshots": [],
          "spec_name": "",
          "state": 0,
          "storage_pool_name": "",
          "storage_pool_type": 0,
          "throughput": 10485760,
          "user_uuid": "",
          "uuid": "9379b2e5-45dd-4760-84d4-f0a5ce90a0e3",
          "version": 0,
          "volume_spec_uuid": "38112d5c-7f13-438a-aec5-d14de51bd30f"
        },
        {
          "attached_vms": [],
          "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
          "cdrom": 0,
          "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
          "created_at": "0001-01-01T00:00:00Z",
          "description": "",
          "host_ip": "",
          "host_name": "",
          "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
          "image_name": "",
          "image_uuid": "",
          "iops": 500,
          "name": "datavolume",
          "operation": "e8bbddd9-2520-4d46-81ea-720e48bad3b1",
          "parent_version": 0,
          "root": 0,
          "size": 20,
          "snapshot_count": 0,
          "snapshots": [],
          "spec_name": "",
          "state": 0,
          "storage_pool_name": "",
          "storage_pool_type": 0,
          "throughput": 10485760,
          "user_uuid": "",
          "uuid": "a27a7c9b-adfa-483a-bd34-d5e7725d19ca",
          "version": 0,
          "volume_spec_uuid": "38112d5c-7f13-438a-aec5-d14de51bd30f"
        }
      ]
    }
  }
}
```

### 查看虚拟机详情

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli compute describeVm --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77 --
```

```
{
  "requestId": "f419f343-d0f2-4f3a-926b-990d9323c896",
  "result": {
    "vm": {
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "boot_type": "bios",
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-04-18T13:41:51Z",
      "description": "",
      "host_ip": "192.168.231.128",
      "host_name": "host-a428263d",
      "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
      "hyper_type": "",
      "image_name": "centos7_cloudinit.qcow2",
      "memory": 1073741824,
      "name": "vm1",
      "nics": [
        {
          "attached_vms": [],
          "created_at": "2024-04-18T13:41:51Z",
          "description": "",
          "gateway": "192.168.231.0",
          "ip": "192.168.231.1",
          "mac": "52:54:00:1a:26:0d",
          "name": "primary-nic-vm1",
          "netmask": "255.255.255.192",
          "network_name": "br1",
          "network_type": 0,
          "operation": "",
          "primary": 1,
          "state": 2,
          "subnet_cidr": "192.168.231.1/26",
          "subnet_name": "subnet1",
          "subnet_uuid": "e73efdf7-d232-4556-ba95-3851100a47b7",
          "uuid": "9579970a-ff8b-450b-b4ac-e062f3338bd9"
        }
      ],
      "operation": "",
      "os_arch": "x86_64",
      "os_detail": "CentOS 7.x",
      "os_type": "CentOS",
      "spec_type": 0,
      "state": 1,
      "tags": null,
      "uuid": "7a46560b-c00b-4acc-a677-4dcfbfa11a77",
      "vcpus": 1,
      "volumes": [
        {
          "attached_vms": [],
          "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
          "cdrom": 0,
          "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
          "created_at": "2024-04-18T13:41:51Z",
          "description": "",
          "host_ip": "",
          "host_name": "",
          "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
          "image_name": "centos7_cloudinit.qcow2",
          "image_uuid": "700fb68a-382a-48be-a7f7-7114559c2f2e",
          "iops": 1000,
          "name": "root-volume-vm1",
          "operation": "",
          "parent_version": -1,
          "root": 1,
          "size": 21474836480,
          "snapshot_count": 0,
          "snapshots": [],
          "spec_name": "",
          "state": 2,
          "storage_pool_name": "",
          "storage_pool_type": 0,
          "throughput": 20971520,
          "user_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
          "uuid": "c3d9c7b0-df2a-4713-8175-a74f3d94573c",
          "version": 0,
          "volume_spec_uuid": "38112d5c-7f13-438a-aec5-d14de51bd30f"
        }
      ]
    }
  }
}
```

### 启动虚拟机

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli compute startVm --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77
```

```
{
  "requestId": "c4214cf2-094a-4797-ad59-87f99a833239",
  "result": {
    "vm": "ok"
  }
}
```

### 停止虚拟机

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli compute stopVm --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77
```

```
{
  "requestId": "ab8daf9f-e4ad-4c1d-b5bc-58bfb4b1ed43",
  "result": {
    "vm": "ok"
  }
}
```

### 更新虚拟机

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli compute updateVm --VmUuid 4be21239-293c-4989-b637-4df104f17caf --updateVmRequest.Name test-vm
```

```
{
  "requestId": "34847e46-2d0e-4ef0-ba76-65e02b7431e4",
  "result": {
    "vm": "ok"
  }
}
```
### 删除虚拟机

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli compute deleteVm --VmUuid 4be21239-293c-4989-b637-4df104f17caf
```

```
{
  "requestId": "3bb72de6-3d03-425b-a004-6b4e1f12c851",
  "result": {
    "vm": "ok"
  }
}
```
## 云硬盘相关命令

### 查看云硬盘列表

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli volume listVolume --state 2
```

```
{
  "requestId": "a93a9e10-706a-443c-9564-ed2d8c829aca",
  "result": {
    "elements": [
      {
        "attached_vms": [],
        "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
        "cdrom": 0,
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2024-04-18T13:41:51Z",
        "description": "",
        "host_ip": "",
        "host_name": "",
        "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
        "image_name": "",
        "image_uuid": "700fb68a-382a-48be-a7f7-7114559c2f2e",
        "iops": 1000,
        "name": "root-volume-vm1",
        "operation": "",
        "parent_version": -1,
        "root": 1,
        "size": 21474836480,
        "snapshot_count": 0,
        "snapshots": [],
        "spec_name": "Standard",
        "state": 2,
        "storage_pool_name": "Local Storage Pool",
        "storage_pool_type": 0,
        "throughput": 20971520,
        "user_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
        "uuid": "c3d9c7b0-df2a-4713-8175-a74f3d94573c",
        "version": 0,
        "volume_spec_uuid": "38112d5c-7f13-438a-aec5-d14de51bd30f"
      }
    ],
    "size": 1,
    "total": 1
  }
}
```

### 新建云硬盘

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli volume createVolume --createVolumeRequest.VolumeSpecUuid 38112d5c-7f13-438a-aec5-d14de51bd30f --createVolumeRequest.HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a --createVolumeRequest.Name test-volume --createVolumeRequest.Size 21474836480 --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774
```

```
{
  "requestId": "2022deeb-e756-4c28-a7e3-0e32e4661100",
  "result": {
    "volume": {
      "attached_vms": [],
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "cdrom": 0,
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "0001-01-01T00:00:00Z",
      "description": "",
      "host_ip": "",
      "host_name": "",
      "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
      "image_name": "",
      "image_uuid": "",
      "iops": 1000,
      "name": "test-volume",
      "operation": "Creating#2022deeb-e756-4c28-a7e3-0e32e4661100",
      "parent_version": 0,
      "root": 0,
      "size": 21474836480,
      "snapshot_count": 0,
      "snapshots": [],
      "spec_name": "",
      "state": 0,
      "storage_pool_name": "",
      "storage_pool_type": 0,
      "throughput": 20971520,
      "user_uuid": "",
      "uuid": "134698fb-b6ef-40f0-962c-b47b644e7d1f",
      "version": 0,
      "volume_spec_uuid": "38112d5c-7f13-438a-aec5-d14de51bd30f"
    }
  }
}
```
### 查看云硬盘

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli volume getVolume --VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f
```

```
{
  "requestId": "2ab9af2c-fc26-49ee-a5e7-a045849d6fac",
  "result": {
    "volume": {
      "attached_vms": [],
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "cdrom": 0,
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-04-19T01:31:30Z",
      "description": "",
      "host_ip": "192.168.231.128",
      "host_name": "host-a428263d",
      "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
      "image_name": "",
      "image_uuid": "",
      "iops": 1000,
      "name": "test-volume",
      "operation": "",
      "parent_version": -1,
      "root": 0,
      "size": 21474836480,
      "snapshot_count": 0,
      "snapshots": [],
      "spec_name": "Standard",
      "state": 1,
      "storage_pool_name": "Local Storage Pool",
      "storage_pool_type": 0,
      "throughput": 20971520,
      "user_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
      "uuid": "134698fb-b6ef-40f0-962c-b47b644e7d1f",
      "version": 0,
      "volume_spec_uuid": "38112d5c-7f13-438a-aec5-d14de51bd30f"
    }
  }
}
```

### 更新云硬盘

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli volume updateVolume --VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f --updateVolumeRequest.Name 'test-volume' --updateVolumeRequest.Description 'volume description'
```

```
{
  "requestId": "ded9e524-20d4-4a45-843b-d6cd13b76ec0",
  "result": {
    "vm": "ok"
  }
}
`

### 删除云硬盘

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli volume deleteVolume --VolumeUuid 9379b2e5-45dd-4760-84d4-f0a5ce90a0e3
```

```
{
  "requestId": "bb931734-6051-486b-b0fb-b33f63de2d29",
  "result": 1
}
```

### 挂载云硬盘

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli compute attachVolumeToVm --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77 --attachVolumeRequest.VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f
```

```
{
  "requestId": "df148989-d472-4f7a-ae83-5c5ac77d8a52",
  "result": {
    "vm": "ok"
  }
}
```

### 卸载云硬盘

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli compute detachVolumeFromVm --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77 --detachVolumeRequest.VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f
```

```
{
  "requestId": "cb41cf74-b3bc-4522-9e8c-0bddd379f1e6",
  "result": {
    "vm": "ok"
  }
}
```

### 创建快照

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli volume createSnapshot --VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f --createSnapshotRequest.Name 'test-snapshot'
```

```
{
  "requestId": "90d98138-f25a-4a52-b277-21c2a095cae3",
  "result": {
    "snapshot": {
      "created_at": "0001-01-01T00:00:00Z",
      "description": "",
      "name": "test-snapshot",
      "operation": "Creating#90d98138-f25a-4a52-b277-21c2a095cae3",
      "parent_volume_version": 0,
      "state": 0,
      "user_uuid": "",
      "uuid": "fec61438-370b-4c19-9333-6ce6ab016e69",
      "volume_uuid": "134698fb-b6ef-40f0-962c-b47b644e7d1f",
      "volume_version": 0
    }
  }
}
```

### 查看云盘快照列表

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
bin/chimecli volume listVolumeSnapshot --VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f
```

```
{
  "requestId": "34e920ef-5b25-4052-b1f4-b6742215a0e8",
  "result": {
    "elements": [
      {
        "created_at": "2024-04-19T02:27:44Z",
        "description": "",
        "name": "test-snapshot",
        "operation": "",
        "parent_volume_version": -1,
        "state": 1,
        "user_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
        "uuid": "fec61438-370b-4c19-9333-6ce6ab016e69",
        "volume_uuid": "134698fb-b6ef-40f0-962c-b47b644e7d1f",
        "volume_version": 0
      }
    ],
    "size": 1,
    "total": 1
  }
}
```
### 查看快照详情

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli volume  getSnapshot --SnapshotUuid fec61438-370b-4c19-9333-6ce6ab016e69
```

```
{
  "requestId": "a03f1ff3-4827-4b51-bdda-68ba94400203",
  "result": {
    "snapshot": {
      "created_at": "2024-04-19T02:27:44Z",
      "description": "",
      "name": "test-snapshot",
      "operation": "",
      "parent_volume_version": -1,
      "state": 1,
      "user_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
      "uuid": "fec61438-370b-4c19-9333-6ce6ab016e69",
      "volume_uuid": "134698fb-b6ef-40f0-962c-b47b644e7d1f",
      "volume_version": 0
    }
  }
}
```

### 更新快照

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli volume  updateSnapshot --SnapshotUuid fec61438-370b-4c19-9333-6ce6ab016e69 --createSnapshotRequest.Name 'test-snapshot' --createSnapshotRequest.Description 'snapshot description'
```

```
{
  "requestId": "78527034-0b25-416c-b510-2bef0c68d4e2",
  "result": {
    "snapshot": "ok"
  }
}
```

### 从快照恢复到云盘

```
chimecli volume restoreVolume fec61438-370b-4c19-9333-6ce6ab016e69 --VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f 
```

```
{
  "requestId": "8a315f3d-bdec-485f-a017-1855b1f98328",
  "result": {
    "volume": {
      "attached_vms": [],
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "cdrom": 0,
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-04-19T01:31:30Z",
      "description": "volume description",
      "host_ip": "",
      "host_name": "",
      "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
      "image_name": "",
      "image_uuid": "",
      "iops": 1000,
      "name": "test-volume",
      "operation": "Restoring#8a315f3d-bdec-485f-a017-1855b1f98328",
      "parent_version": 0,
      "root": 0,
      "size": 21474836480,
      "snapshot_count": 0,
      "snapshots": [],
      "spec_name": "",
      "state": 1,
      "storage_pool_name": "",
      "storage_pool_type": 0,
      "throughput": 20971520,
      "user_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
      "uuid": "134698fb-b6ef-40f0-962c-b47b644e7d1f",
      "version": 2,
      "volume_spec_uuid": "38112d5c-7f13-438a-aec5-d14de51bd30f"
    }
  }
}
```

### 删除快照

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli volume deleteSnapshot --SnapshotUuid fec61438-370b-4c19-9333-6ce6ab016e69
```

```
{
  "requestId": "3198bfaf-dfb6-478a-8ef7-abf7396372df",
  "result": "ok"
}
```

## 弹性网卡相关命令

### 查看弹性网卡列表

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli network listNic --state 2
```

```
{
  "requestId": "3ef89c92-2abb-47b5-a6a4-3a2f913802df",
  "result": {
    "elements": [
      {
        "attached_vms": [],
        "created_at": "2024-04-18T13:41:51Z",
        "description": "",
        "gateway": "192.168.231.0",
        "ip": "192.168.231.1",
        "mac": "52:54:00:1a:26:0d",
        "name": "primary-nic-vm1",
        "netmask": "255.255.255.192",
        "network_name": "br1",
        "network_type": 0,
        "operation": "",
        "primary": 1,
        "state": 2,
        "subnet_cidr": "192.168.231.1/26",
        "subnet_name": "subnet1",
        "subnet_uuid": "e73efdf7-d232-4556-ba95-3851100a47b7",
        "uuid": "9579970a-ff8b-450b-b4ac-e062f3338bd9"
      }
    ],
    "size": 1,
    "total": 1
  }
}
```

### 新建弹性网卡

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli network createNic --createNicRequest.SubnetUuid e73efdf7-d232-4556-ba95-3851100a47b7 --createNicRequest.Name test-nic
```

```
{
  "requestId": "e926a987-2073-4258-8739-41b60bd637a4",
  "result": {
    "nic": {
      "attached_vms": [],
      "created_at": "0001-01-01T00:00:00Z",
      "description": "",
      "gateway": "192.168.231.0",
      "ip": "192.168.231.2",
      "mac": "52:54:00:8a:31:6a",
      "name": "test-nic",
      "netmask": "255.255.255.192",
      "network_name": "br1",
      "network_type": 0,
      "operation": "",
      "primary": 0,
      "state": 0,
      "subnet_cidr": "",
      "subnet_name": "",
      "subnet_uuid": "e73efdf7-d232-4556-ba95-3851100a47b7",
      "uuid": "16655315-8684-4e22-bd5f-4d8d30618629"
    }
  }
}
```
### 查看弹性网卡

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli network getNic --NicUuid 16655315-8684-4e22-bd5f-4d8d30618629
```

```
{
  "requestId": "e47884dd-973f-469c-95a9-f704c8f4f925",
  "result": {
    "nic": {
      "attached_vms": [],
      "created_at": "2024-04-19T04:04:30Z",
      "description": "",
      "gateway": "192.168.231.0",
      "ip": "192.168.231.2",
      "mac": "52:54:00:8a:31:6a",
      "name": "test-nic",
      "netmask": "255.255.255.192",
      "network_name": "br1",
      "network_type": 0,
      "operation": "",
      "primary": 0,
      "state": 1,
      "subnet_cidr": "192.168.231.1/26",
      "subnet_name": "subnet1",
      "subnet_uuid": "e73efdf7-d232-4556-ba95-3851100a47b7",
      "uuid": "16655315-8684-4e22-bd5f-4d8d30618629"
    }
  }
}
```

### 更新弹性网卡

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli network updateNic --NicUuid 16655315-8684-4e22-bd5f-4d8d30618629 --updateNicRequest.Name 'test-nic-new'
```

```
{
  "requestId": "edce4af3-c02f-4e73-823f-cca75b9870a5",
  "result": {
    "vm": "ok"
  }
}
```

### 删除弹性网卡

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli network deleteNic --NicUuid 16655315-8684-4e22-bd5f-4d8d30618629
```

```
{
  "requestId": "3269c569-e2f1-408c-b0e5-06ba7eeadf0f",
  "result": 1
}
```

### 挂载弹性网卡

#### 命令原型

#### 参数列表

#### 示例

命令行:

```
chimecli compute attachNicToVm --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77 --attachNicRequest.NicUuid 16655315-8684-4e22-bd5f-4d8d30618629
```

```
{
  "requestId": "a939c0ef-ec0c-4e71-b29b-c900d929f5d0",
  "result": {
    "vm": "ok"
  }
}
```

### 卸载弹性网卡

#### 命令原型

#### 参数列表

#### 示例

命令行:
```
chimecli compute detachNicFromVm --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77 --detachNicRequest.NicUuid 16655315-8684-4e22-bd5f-4d8d30618629
```

```
{
  "requestId": "c6eac3d4-67e8-4e39-a585-3d64a352c2ac",
  "result": {
    "vm": "ok"
  }
}
```