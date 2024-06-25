---
title: 3.4 命令行工具(CLI)介绍
weight: 4
description: 本章介绍ChimeStack命令行工具(CLI)的使用方法
---

## 概述

chimecli是一个通过命令行管理操作ChimeStack的工具。

### CLI使用方法

CLI命令格式为:

```
chimecli <resource category> <operation> [flags]  
```

> "resource category"为资源类别，目前可用CLI管理操作的资源为: 

- az: 可用区
- cluster: 集群
- host: 节点
- storage_pool: 存储池
- network: 网络
- instance_spec: 计算规格
- volume_spec: 云硬盘规格
- image: 镜像
- alert: 报警
- compute: 虚拟机
- volume: 云硬盘
- user: 用户

> "operation"为操作资源的命令，是对[API](/docs/reference/api/)的封装，和[API](/docs/reference/api/)相对应。

> "flags"是命令相关的输入参数，具体可以通过"chimecli <resource category> <operation> --help"查看参数说明. 


CLI的全部命令(除了登录/登出)，都需要进行用户身份认证，在使用CLI命令前，需要先进行用户登录(login), 登录成功后，登录信息会保存在当前用户的默认配置中(~/.config/chimecli/config.yaml)；如果不再需要继续使用CLI，需要进行登出(logout)操作以保障用户的信息安全。

### 登录

> 命令原型:

```
chimecli login --help
chimecli login

Usage:
  chimecli login [flags]

Flags:
      --api-endpoint string   the endpoint of the chime api service (default "127.0.0.1:8801")
  -h, --help                  help for login
      --name string           the account name to login (default "admin")
      --password string       the password to login (default "admin")

```

> 参数列表: 

|Name|Type|Required|Description|
|---|---|---|---|
|api-endpoint|string|true|the endpoint of the chime api service |
|name|string|true|the account name to login |
|password|string|true|the password to login|

> 示例: 

```
chimecli login --api-endpoint 192.168.231.128:8801 --name user --password admin 
2024/04/25 08:51:08  ****** account login successfully! ******
```

### 登出

> 命令原型:

```
chimecli logout --help
chimecli logout

Usage:
  chimecli logout [flags]

Flags:
  -h, --help   help for logout
```

> 示例: 

```
chimecli logout 
2024/04/25 08:52:39  ****** account logout successfully! ******
```

## 可用区(AZ)操作命令

### 查看AZ列表

#### 命令原型

```
chimecli az listAz --help
This will show all available azs by default.

Usage:
  chimecli az listAz [flags]

Flags:
  -h, --help           help for listAz
      --name string    filter by the 'name' field
      --order string   'asc' or 'desc' of sorting
      --page int       the page number of the results in paging
      --size int       the page size of the results in paging
      --sort string    the field to be sorted by
      --state int      filter by the 'state' field
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

#### 示例

命令行:

```
chimecli az listAz
```

返回: 

```
{
  "requestId": "8cfbae8a-b9b6-4f82-8e5a-2c7121794578",
  "result": {
    "elements": [
      {
        "created_at": "2023-06-29T03:46:02Z",
        "description": "default zone",
        "name": "Default",
        "state": 1,
        "uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865"
      },
      {
        "created_at": "2023-06-28T21:50:11Z",
        "description": "update az",
        "name": "Backup Zone",
        "state": 1,
        "uuid": "43340503-02e3-4223-bee3-2548957bc22b"
      }
    ],
    "size": 2,
    "total": 2
  }
}
```

### 新建AZ

#### 命令原型

```
chimecli az createAz --help 
This will create an available az.

Usage:
  chimecli az createAz [flags]

Flags:
      --Body string                          Optional json string for [Body]. the http post body
      --createAzRequest.Description string   description for the AZ
      --createAzRequest.Name string          Required. the AZ's name  
  -h, --help                                 help for createAz
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|body|[CreateAzRequest](#schemacreateazrequest)|false|the http post body|

**CreateAzRequest参数**: 


|Name|Type|Required|Description|
|---|---|---|---|
|createAzRequest.Description|string|false|description for the AZ|
|createAzRequest.Name|string|true|the AZ's name|

#### 示例

命令行:

```
chimecli az createAz \
  --createAzRequest.Name test-az \
  --createAzRequest.Description 'an Az example' 
```

### 查看AZ详情

#### 命令原型

```
chimecli az getAz --help
This will describe an available az.

Usage:
  chimecli az getAz [flags]

Flags:
      --AzUuid string   Required. the AZ's uuid
  -h, --help            help for getAz
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|

#### 示例

命令行:

```
chimecli az getAz --AzUuid 1b0dc604-8f60-4bec-80aa-38de4644c6e7
```

返回: 

```
{
  "requestId": "f6a9ea50-f9ac-405e-b489-540169501fd1",
  "result": {
    "az": {
      "created_at": "2024-04-23T08:16:01Z",
      "description": "an Az example",
      "name": "test-az",
      "state": 1,
      "uuid": "1b0dc604-8f60-4bec-80aa-38de4644c6e7"
    }
  }
}
```

### 修改AZ

#### 命令原型

```
chimecli az updateAz --help
This will update an available az.

Usage:
  chimecli az updateAz [flags]

Flags:
      --AzUuid string                        Required. the AZ's uuid
      --Body string                          Optional json string for [Body]. the http post body
  -h, --help                                 help for updateAz
      --updateAzRequest.Description string   description for the AZ
      --updateAzRequest.Name string          Required. the AZ's name

```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|body|[UpdateAzRequest](#schemaupdateazrequest)|true|the http post body|

**UpdateAzRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|updateAzRequest.Description|string|false|description for the AZ|
|updateAzRequest.Name|string|true|the AZ's name|

#### 示例

命令行:

```
chimecli az updateAz \
  --AzUuid 1b0dc604-8f60-4bec-80aa-38de4644c6e7 \
  --createAzRequest.Name 'test-az2' \
  --createAzRequest.Description 'an Az example'
```

返回: 

```
{
  "requestId": "0cbff938-1e78-4c8a-b00e-0535be12fa82",
  "result": {
    "az": "ok"
  }
}
```

### 启用AZ

#### 命令原型

```
chimecli az enableAz --help
This will enable an available az.

Usage:
  chimecli az enableAz [flags]

Flags:
      --AzUuid string   Required. the AZ's uuid
  -h, --help            help for enableAz
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|

#### 示例

命令行:

```
chimecli az enableAz --AzUuid 1b0dc604-8f60-4bec-80aa-38de4644c6e7
```

返回: 

```
{
  "requestId": "7aea36d3-c233-48a7-ab32-c23a8e3836c5",
  "result": {
    "az": "ok"
  }
}
```

### 停用AZ

#### 命令原型

```
chimecli az disableAz --help
This will disable an available az.

Usage:
  chimecli az disableAz [flags]

Flags:
      --AzUuid string   Required. the AZ's uuid
  -h, --help            help for disableAz
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|

#### 示例

命令行:

```
chimecli az disableAz --AzUuid 1b0dc604-8f60-4bec-80aa-38de4644c6e7
```

返回: 

```
{
  "requestId": "ee841a17-fd9c-4bc5-956d-d834f33a9e2e",
  "result": {
    "az": "ok"
  }
}
```

### 删除AZ

#### 命令原型

```
chimecli az deleteAz --help 
This will delete an available az.

Usage:
  chimecli az deleteAz [flags]

Flags:
      --AzUuid string   Required. the AZ's uuid
  -h, --help            help for deleteAz
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|

#### 示例

命令行:

```
chimecli az deleteAz --AzUuid 1b0dc604-8f60-4bec-80aa-38de4644c6e7
```

返回: 

```
{
  "requestId": "5ee30b76-2a1a-4a1e-8b23-5afc150382fc",
  "result": 1
}
```


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


**CreateClusterRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createClusterRequest.Arch|string|false|the cluster's architecture, like x86_64, arm, ...|
|createClusterRequest.Description|string|false|description for the cluster|
|createClusterRequest.HypervisorType|string|false|the cluster's hypervisor type, like kvm (default), xen, ...|
|createClusterRequest.Name|string|true|the cluster's name|
|createClusterRequest.Type|integer|false|the cluster's type|

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
  -h, --help                                         help for updateCluster
      --updateClusterRequest.Arch string             the cluster's architecture, like x86_64, arm, ...
      --updateClusterRequest.Description string      description for the cluster
      --updateClusterRequest.HypervisorType string   the cluster's hypervisor type, like kvm (default), xen, ...
      --updateClusterRequest.Name string             Required. the cluster's name
      --updateClusterRequest.Type int                the cluster's type

```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|body|[UpdateClusterRequest](#schemaupdateclusterrequest)|true|the http post body|

**UpdateClusterRequest**:

|Name|Type|Required|Description|
|---|---|---|---|
|updateClusterRequest.Arch|string|false|the cluster's architecture, like x86_64, arm, ...|
|updateClusterRequest.Description|string|false|description for the cluster|
|updateClusterRequest.HypervisorType|string|false|the cluster's hypervisor type, like kvm (default), xen, ...|
|updateClusterRequest.Name|string|true|the cluster's name|
|updateClusterRequest.Type|integer|false|the cluster's type|

#### 示例

命令行:

```
chimecli cluster updateCluster \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e \
  --updateClusterRequest.Description 'cluster description' \
  --updateClusterRequest.Name 'test-cluster' 
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
chimecli cluster enableCluster \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
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
chimecli cluster disableCluster \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
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
chimecli cluster deleteCluster \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
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
      --monitor_state int    filter by the 'monitor_state' field
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
|monitor_state|integer|false|filter by the 'monitor_state' field|
|rack_name|string|false|filter by the rack's name|
|manage_ip|string|false|filter by the host's management IP address|
|AzUuid|string|true|filter by the AZ's uuid|
|ClusterUuid|string|true|filter by the cluster's uuid|

#### 示例

命令行:

```
chimecli host listHost \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e
```

返回:


```
{
  "requestId": "c1e1595f-e0e1-4d06-aad2-8baa09b0a783",
  "result": {
    "elements": [
      {
        "active_domains": 1,
        "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
        "cluster_name": "Default",
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2024-06-22T09:11:02Z",
        "description": "",
        "domains": 1,
        "heartbeat_at": "2024-06-23T09:09:42Z",
        "last_operation_created_at": "2024-06-24T11:35:07Z",
        "last_operation_finished_at": "2024-06-24T11:35:07Z",
        "last_operation_name": "drain",
        "last_operation_state": 1,
        "manage_ip": "192.168.231.175",
        "monitor_state": 0,
        "name": "dev3",
        "networks": [],
        "node_ip": "10.10.10.3",
        "operation": "",
        "physical_memory": 0,
        "physical_vcpus": 0,
        "rack_name": "rack1",
        "reserved_ip1": "",
        "reserved_ip2": "",
        "reserved_memory": 0,
        "reserved_vcpus": 0,
        "state": 5,
        "storage_ip": "172.28.10.3",
        "storage_pools": [],
        "tasks": [],
        "total_memory": 0,
        "total_vcpus": 0,
        "used_memory": 0,
        "used_vcpus": 0,
        "uuid": "12345678-1112-449d-8d3e-3ff8b1323d9e",
        "vm_count": 1,
        "vm_running_count": 0,
        "vms": []
      },
      {
        "active_domains": 1,
        "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
        "cluster_name": "Default",
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2024-06-17T12:05:19Z",
        "description": "",
        "domains": 1,
        "heartbeat_at": "2024-06-23T09:09:44Z",
        "last_operation_created_at": "2024-06-17T12:05:19Z",
        "last_operation_finished_at": "2024-06-17T12:05:19Z",
        "last_operation_name": "create",
        "last_operation_state": 1,
        "manage_ip": "192.168.231.128",
        "monitor_state": 0,
        "name": "host-a428263d",
        "networks": [],
        "node_ip": "10.10.10.1",
        "operation": "",
        "physical_memory": 0,
        "physical_vcpus": 0,
        "rack_name": "rack1",
        "reserved_ip1": "",
        "reserved_ip2": "",
        "reserved_memory": 0,
        "reserved_vcpus": 0,
        "state": 1,
        "storage_ip": "172.28.10.1",
        "storage_pools": [],
        "tasks": [],
        "total_memory": 0,
        "total_vcpus": 0,
        "used_memory": 0,
        "used_vcpus": 0,
        "uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
        "vm_count": 1,
        "vm_running_count": 1,
        "vms": []
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

**CreateHostRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createHostRequest.CpuRatio|float|false|the CPU's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical CPUs in the node.|
|createHostRequest.Description|string|false|description for the host|
|createHostRequest.MemoryRatio|float|false|the memory's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical memory in the node.|
|createHostRequest.ReservedMemory|integer|false|the reserverd memory number, which will not be allocated to virtual machines.|
|createHostRequest.ReservedVcpus|integer|false|the reserverd CPU number, which will not be allocated to virtual machines.|
|createHostRequest.Uuid|string|true|the host's Uuid|

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
chimecli host getHost \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e \
  --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
```

返回:

```
{
  "requestId": "0000e0b4-94e8-42bf-802d-84619d21da2d",
  "result": {
    "host": {
      "active_domains": 1,
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "cluster_name": "Default",
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-06-17T12:05:19Z",
      "description": "",
      "domains": 1,
      "heartbeat_at": "2024-06-23T09:09:44Z",
      "last_operation_created_at": null,
      "last_operation_finished_at": null,
      "last_operation_name": "",
      "last_operation_state": 0,
      "manage_ip": "192.168.231.128",
      "monitor_state": 0,
      "name": "host-a428263d",
      "networks": [
        {
          "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
          "cluster_name": "",
          "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
          "created_at": "2024-06-17T11:10:24Z",
          "description": "",
          "interface_name": "ens224",
          "name": "br1",
          "state": 1,
          "type": 0,
          "uuid": "0851de9d-631b-4a50-b52f-df636a954ef7",
          "vlan_id": ""
        }
      ],
      "node_ip": "10.10.10.1",
      "operation": "",
      "physical_memory": 8038023168,
      "physical_vcpus": 4,
      "rack_name": "rack1",
      "reserved_ip1": "",
      "reserved_ip2": "",
      "reserved_memory": 0,
      "reserved_vcpus": 0,
      "state": 1,
      "storage_ip": "172.28.10.1",
      "storage_pools": [
        {
          "az_uuid": "",
          "cluster_name": "",
          "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
          "created_at": "2024-05-12T02:42:25Z",
          "description": "",
          "meta": "{\"backend_path\":\"/chime/backend\",\"image_cache_path\":\"/chime/cache\"}",
          "name": "new-storagepool",
          "physical_size": 0,
          "reserved_size": 0,
          "state": 1,
          "total_size": 0,
          "type": 0,
          "used_size": 0,
          "uuid": "3b3cb1d6-b84e-4633-8cb1-5e6b4969c0fb"
        },
        {
          "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
          "cluster_name": "",
          "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
          "created_at": "2023-06-25T19:10:18Z",
          "description": "local storage pool2aa",
          "meta": "{\"backend_path\":\"/hyperc/backend\",\"image_cache_path\":\"/hyperc/cache\"}",
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
      "tasks": [
        {
          "created_at": "2024-06-17T12:05:19Z",
          "description": "create-host-flowchain-a428263d-64a9-4653-8d7e-556c20c0d77a",
          "finished_at": "2024-06-17T12:05:19Z",
          "operation_name": "create",
          "request_id": "0321588b-2b0e-47b8-a907-657340ec5453",
          "resource_type": "host",
          "resource_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
          "state": 1,
          "updated_at": "2024-06-17T12:05:19Z",
          "uuid": "08a8aa99-8d3e-4b10-a8e1-924f3fe8e7d3"
        },
        {
          "created_at": "2024-06-17T12:05:10Z",
          "description": "delete-host-flowchain-a428263d-64a9-4653-8d7e-556c20c0d77a",
          "finished_at": "2024-06-17T12:05:10Z",
          "operation_name": "delete",
          "request_id": "a5eb672b-7ebd-411a-8c4d-c97462dbc74e",
          "resource_type": "host",
          "resource_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
          "state": 1,
          "updated_at": "2024-06-17T12:05:10Z",
          "uuid": "d25fd1fb-fb30-43cd-80e0-c992aadf7ea4"
        }
      ],
      "total_memory": 8038023168,
      "total_vcpus": 4,
      "used_memory": 1073741824,
      "used_vcpus": 1,
      "uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
      "vm_count": 1,
      "vm_running_count": 1,
      "vms": [
        {
          "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
          "boot_type": "",
          "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
          "created_at": "2024-06-22T07:55:38Z",
          "description": "",
          "host_ip": "",
          "host_name": "",
          "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
          "hyper_type": "",
          "image_name": "",
          "last_operation_created_at": null,
          "last_operation_finished_at": null,
          "last_operation_name": "",
          "last_operation_state": 0,
          "memory": 1073741824,
          "name": "vm-ceph",
          "nics": [],
          "operation": "",
          "os_arch": "",
          "os_detail": "",
          "os_type": "",
          "spec_type": 0,
          "state": 1,
          "tags": null,
          "tasks": [],
          "uuid": "2fc99bf7-7f78-4a07-b7d6-471f3b0b5001",
          "vcpus": 1,
          "volumes": []
        }
      ]
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


**UpdateHostRequest参数**: 

|Name|Type|Required|Description|
|---|---|---|---|
|updateHostRequest.CpuRatio|float|false|the CPU's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical CPUs in the node.|
|updateHostRequest.Description|string|false|description for the host|
|updateHostRequest.MemoryRatio|float|false|the memory's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical memory in the node.|
|updateHostRequest.ReservedMemory|integer|false|the reserverd memory number, which will not be allocated to virtual machines.|
|updateHostRequest.ReservedVcpus|integer|false|the reserverd CPU number, which will not be allocated to virtual machines.|

#### 示例

命令行:
```
chimecli host updateHost \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e \
  --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a \
  --updateHostRequest.CpuRatio 2.0 \
  --updateHostRequest.CpuReserved 1 \
  --updateHostRequest.MemoryRatio 2.0 \
  --updateHostRequest.MemoryReserved 0
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
chimecli host deleteHost \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e \
  --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
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
chimecli host enableHost \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e \
  --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
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
chimecli host disableHost \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e \
  --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
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
chimecli host suspendHost \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e \
  --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a
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


### 迁移Host 

#### 命令原型

```
chimecli host migrateHost --help
migrate all host's virtual machines to another hosts

Usage:
  chimecli host migrateHost [flags]

Flags:
      --AzUuid string                              Required. the AZ's uuid
      --Body string                                Optional json string for [Body]. the http post body
      --ClusterUuid string                         Required. the cluster's uuid
      --HostUuid string                            Required. the host's uuid
  -h, --help                                       help for migrateHost
      --migrateHostRequest.MigrateLocalDiskVms     whether to migrate the virtual machines with local disks (default is false)
      --migrateHostRequest.TargetHostUuid string   the target host's uuid, system will automatically assign one host if omit
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|HostUuid|string|true|the host's uuid|
|migrateHostRequest.MigrateLocalDiskVms|bool|false|whether to migrate the virtual machines with local disks｜
|migrateHostRequest.TargetHostUuid|string|false|the target host's uuid, system will automatically assign one host if omit｜

#### 示例

命令行:
```
chimecli host migrateHost \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e \
  --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a \
  --migrateHostRequest.MigrateLocalDiskVms \
  --migrateHostRequest.TargetHostUuid 12345678-1112-449d-8d3e-3ff8b1323d9e 
```

返回:

```
{
  "requestId": "8ab00455-caf3-4aad-9ffc-491c2243f518",
  "result": {
    "host": "ok"
  }
}
```


### 清空Host 

#### 命令原型

```
chimecli host drainHost --help
stop all host's virtual machines

Usage:
  chimecli host drainHost [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --HostUuid string      Required. the host's uuid
  -h, --help                 help for drainHost
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
chimecli host drainHost \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e \
  --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a 
```

返回:

```
{
  "requestId": "cf297413-7e55-4348-9af9-c2df0c794383",
  "result": {
    "host": "ok"
  }
}
```


### 重建Host 

#### 命令原型

```
chimecli host rebuildHost --help
rebuild all the host's virtual machines to another host

Usage:
  chimecli host rebuildHost [flags]

Flags:
      --AzUuid string                              Required. the AZ's uuid
      --Body string                                Optional json string for [Body]. the http post body
      --ClusterUuid string                         Required. the cluster's uuid
      --HostUuid string                            Required. the host's uuid
  -h, --help                                       help for rebuildHost
      --rebuildHostRequest.TargetHostUuid string   the target host's uuid, system will automatically assign one host if omit
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|HostUuid|string|true|the host's uuid|
|rebuildHostRequest.TargetHostUuid|string|false|the target host's uuid, system will automatically assign one host if omit｜

#### 示例

命令行:
```
chimecli host rebuildHost \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid e359211d-a882-4609-baad-db57557fdf2e \
  --HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a \
  --migrateHostRequest.TargetHostUuid 12345678-1112-449d-8d3e-3ff8b1323d9e 
```

返回:

```
{
  "requestId": "ff85da27-9887-48bc-a038-334d7d352c77",
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
  "requestId": "f4d68139-6355-470e-bea2-660c49316195",
  "result": {
    "elements": [
      {
        "active_domains": 1,
        "active_used_memory": 1073741824,
        "active_used_vcpus": 1,
        "created_at": "2024-05-13T06:35:14Z",
        "description": "",
        "domains": 1,
        "heartbeat_at": "2024-06-23T09:09:42Z",
        "manage_ip": "192.168.231.175",
        "monitor_state": 0,
        "name": "dev3",
        "node_ip": "10.10.10.3",
        "rack_name": "rack1",
        "reserved_ip1": "",
        "reserved_ip2": "",
        "state": 1,
        "storage_ip": "172.28.10.3",
        "used_memory": 1073741824,
        "used_vcpus": 1,
        "uuid": "12345678-1112-449d-8d3e-3ff8b1323d9e"
      },
      {
        "active_domains": 1,
        "active_used_memory": 1073741824,
        "active_used_vcpus": 1,
        "created_at": "2024-04-11T10:56:57Z",
        "description": "",
        "domains": 1,
        "heartbeat_at": "2024-06-23T09:09:44Z",
        "manage_ip": "192.168.231.128",
        "monitor_state": 0,
        "name": "host-a428263d",
        "node_ip": "10.10.10.1",
        "rack_name": "rack1",
        "reserved_ip1": "",
        "reserved_ip2": "",
        "state": 1,
        "storage_ip": "172.28.10.1",
        "used_memory": 1073741824,
        "used_vcpus": 1,
        "uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a"
      },
      {
        "active_domains": 0,
        "active_used_memory": 0,
        "active_used_vcpus": 0,
        "created_at": "2024-04-01T11:07:49Z",
        "description": "",
        "domains": 0,
        "heartbeat_at": "2024-04-15T11:29:33Z",
        "manage_ip": "192.168.231.158",
        "monitor_state": 0,
        "name": "dennis",
        "node_ip": "",
        "rack_name": "rack1",
        "reserved_ip1": "",
        "reserved_ip2": "",
        "state": 0,
        "storage_ip": "",
        "used_memory": 0,
        "used_vcpus": 0,
        "uuid": "a4824bcd-1112-449d-8d3e-3ff8b1323d9e"
      }
    ],
    "size": 3,
    "total": 3
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

**CreateInstanceSpecRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createInstanceSpecRequest.Description|string|false|description for the instance specification|
|createInstanceSpecRequest.Memory|integer|true|the number of memory|
|createInstanceSpecRequest.Name|string|true|the instance specification's name|
|createInstanceSpecRequest.Type|integer|false|the instance specification's type, 0: shared resource, 1: dedicated resource|
|createInstanceSpecRequest.Vcpus|integer|true|the number of vCPUs|

#### 示例

命令行:

```
chimecli instance_spec createInstanceSpec \
  --createInstanceSpecRequest.Name test-spec \
  --createInstanceSpecRequest.Type 1 \
  --createInstanceSpecRequest.Vcpus 1 \
  --createInstanceSpecRequest.Memory 16777216
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
  -h, --help                                           help for updateInstanceSpec
      --updateInstanceSpecRequest.Description string   description for the instance specification
      --updateInstanceSpecRequest.Memory int           Required. the number of memory
      --updateInstanceSpecRequest.Name string          Required. the instance specification's name
      --updateInstanceSpecRequest.Type int             the instance specification's type, 0: shared resource, 1: dedicated resource
      --updateInstanceSpecRequest.Vcpus int            Required. the number of vCPUs
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|InstanceSpecUuid|string|true|the instance specification's uuid|
|body|[UpdateInstanceSpecRequest](#schemaupdateinstancespecrequest)|true|the http post body|

**UpdateInstanceSpecRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|updateInstanceSpecRequest.Description|string|false|description for the instance specification|
|updateInstanceSpecRequest.Memory|integer|true|the number of memory|
|updateInstanceSpecRequest.Name|string|true|the instance specification's name|
|updateInstanceSpecRequest.Type|integer|false|the instance specification's type, 0: shared resource, 1: dedicated resource|
|updateInstanceSpecRequest.Vcpus|integer|true|the number of vCPUs|

#### 示例

命令行:

```
chimecli instance_spec updateInstanceSpec \
  --InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c \
  --updateInstanceSpecRequest.Type 1 \
  --updateInstanceSpecRequest.Vcpus 2 \
  --updateInstanceSpecRequest.Name test-spec \
  --updateInstanceSpecRequest.Memory 16777216
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

**CreateClusterInstanceSpecRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createClusterInstanceSpecRequest.InstanceSpecUuid|string|true|the instance specification's Uuid|

#### 示例

命令行:

```
chimecli instance_spec createClusterInstanceSpecRelation \
  --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
  --createClusterInstanceSpecRequest.InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c
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
chimecli instance_spec deleteClusterInstanceSpecRelation \
  --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
  --InstanceSpecUuid 849075e3-7b00-498d-9061-83996f3d370c
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

**CreateVolumeSpecRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createVolumeSpecRequest.Description|string|false|description for the volume specification|
|createVolumeSpecRequest.MaxIops|integer|true|the max iops value of the volume specification|
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
chimecli volume_spec createVolumeSpec \
  --createVolumeSpecRequest.Name test-volume-spec \
  --createVolumeSpecRequest.MaxIops 1000 \
  --createVolumeSpecRequest.MinIops 500 \
  --createVolumeSpecRequest.StepIops 10 \
  --createVolumeSpecRequest.MaxThroughput 104857600 \
  --createVolumeSpecRequest.MinThroughput 10485760 \
  --createVolumeSpecRequest.StepThroughput 1048576 \
  --createVolumeSpecRequest.StoragePoolUuid f5165a18-e6b3-42b4-8efc-ad496f318a0a
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
  -h, --help                                             help for updateVolumeSpec
      --updateVolumeSpecRequest.Description string       description for the volume specification
      --updateVolumeSpecRequest.MaxIops int              Required. 
      --updateVolumeSpecRequest.MaxThroughput int        Required. the max throughput value of the volume specification
      --updateVolumeSpecRequest.MinIops int              Required. the min iops value of the volume specification
      --updateVolumeSpecRequest.MinThroughput int        Required. the min throughput value of the volume specification
      --updateVolumeSpecRequest.Name string              Required. the volume specification's name
      --updateVolumeSpecRequest.StepIops int             Required. the step iops value of the volume specification
      --updateVolumeSpecRequest.StepThroughput int       Required. the step throughput value of the volume specification
      --updateVolumeSpecRequest.StoragePoolUuid string   Required. the storage pool's Uuid 
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VolumeSpecUuid|string|true|the volume specification's uuid|
|body|[UpdateVolumeSpecRequest](#schemaupdatevolumespecrequest)|true|the http post body|

**UpdateVolumeSpecRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|updateVolumeSpecRequest.Description|string|false|description for the volume specification|
|updateVolumeSpecRequest.MaxIops|integer|true|the max iops value of the volume specification|
|updateVolumeSpecRequest.MaxThroughput|integer|true|the max throughput value of the volume specification|
|updateVolumeSpecRequest.MinIops|integer|true|the min iops value of the volume specification|
|updateVolumeSpecRequest.MinThroughput|integer|true|the min throughput value of the volume specification|
|updateVolumeSpecRequest.Name|string|true|the volume specification's name|
|updateVolumeSpecRequest.StepIops|integer|true|the step iops value of the volume specification|
|updateVolumeSpecRequest.StepThroughput|integer|true|the step throughput value of the volume specification|
|updateVolumeSpecRequest.StoragePoolUuid|string|true|the storage pool's Uuid|

#### 示例

命令行:

```
chimecli volume_spec updateVolumeSpec \
  --VolumeSpecUuid c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa \
  --updateVolumeSpecRequest.Name test-volume-spec \
  --updateVolumeSpecRequest.MaxIops 1000 \
  --updateVolumeSpecRequest.MinIops 500 \
  --updateVolumeSpecRequest.StepIops 10 \
  --updateVolumeSpecRequest.MaxThroughput 104857600 \
  --updateVolumeSpecRequest.MinThroughput 10485760 \
  --updateVolumeSpecRequest.StepThroughput 10485760 \
  --updateVolumeSpecRequest.StoragePoolUuid f5165a18-e6b3-42b4-8efc-ad496f318a0a
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

**CreateClusterVolumeSpecRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createClusterVolumeSpecRequest.VolumeSpecUuid|string|true|the volume specification's Uuid|

#### 示例

命令行:

```
chimecli volume_spec createClusterVolumeSpecRelation \
  --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
  --createClusterVolumeSpecRequest.VolumeSpecUuid c70e7af9-6f9f-49d1-b51a-8b5cb716c9fa
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
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|state|integer|false|filter by the 'state' field|
|type|integer|false|filter by network type(0: classical network, 1:vlan, 2:vxlan)|
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

**CreateNetworkRequest参数**: 

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

**UpdateNetworkRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|updateNetworkRequest.Description|string|false|description for the network|
|updateNetworkRequest.Name|string|true|the network's name|

#### 示例

命令行:

```
chimecli network updateNetwork \
  --NetworkUuid 52899f98-3963-4ae0-abde-2ea72e27f2b6 \
  --updateNetworkRequest.Name br1 \
  --updateNetworkRequest.Description br1-network
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

**CreateSubnetRequest参数**:

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
  -h, --help                                     help for updateSubnet
      --updateSubnetRequest.CIDR string          Required. the CIDR value, e.g. 192.168.231.1/24
      --updateSubnetRequest.Description string   description for the subnet
      --updateSubnetRequest.Gateway string       the gateway of the subnet
      --updateSubnetRequest.Name string          Required. the subnet's name
      --updateSubnetRequest.ReservedIps string   the reserved ips inside the subnet, which will not be assigned to virtual machines
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|NetworkUuid|string|true|the network's uuid|
|SubnetUuid|string|true|the subnet's uuid|
|body|[UpdateSubnetRequest](#schemaupdatesubnetrequest)|false|the http post body|

**UpdateSubnetRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|updateSubnetRequest.Cidr|string|true|the CIDR value, e.g. 192.168.231.1/24|
|updateSubnetRequest.Description|string|false|description for the subnet|
|updateSubnetRequest.Gateway|string|false|the gateway of the subnet|
|updateSubnetRequest.Name|string|true|the subnet's name|
|updateSubnetRequest.ReservedIps|string|false|the reserved ips inside the subnet, which will not be assigned to virtual machines|

#### 示例

命令行:

```
chimecli network updateSubnet \
  --SubnetUuid fed410bf-da50-490f-a045-314b08dc8ad5 \
  --NetworkUuid f2a515db-7699-4970-b13c-a8ea9840f62e \
  --updateSubnetRequest.CIDR 192.168.231.200/32 \
  --updateSubnetRequest.ReservedIps 192.168.231.128,192.168.231.158 \
  --updateSubnetRequest.Name subnet2
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

```
chimecli storage_pool listStoragePool --help
list storage pools

Usage:
  chimecli storage_pool listStoragePool [flags]

Flags:
      --AzUuid string        Required. filter by the AZ's uuid
      --ClusterUuid string   Required. filter by the cluster's uuid
  -h, --help                 help for listStoragePool
      --name string          filter by the 'name' field
      --order string         'asc' or 'desc' of sorting
      --page int             the page number of the results in paging
      --size int             the page size of the results in paging
      --sort string          the field to be sorted by
      --state int            filter by the 'state' field
      --type int             filter the storage pool's type (0: local, 1: iscsi, 2: ceph)
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
|type|integer|false|filter the storage pool's type (0: local, 1: iscsi, 2: ceph)|
|AzUuid|string|true|filter by the AZ's uuid|
|ClusterUuid|string|true|filter by the cluster's uuid|

#### 示例

命令行:

```
chimecli storage_pool listStoragePool \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774
```

返回:

```
{
  "requestId": "1b5d3610-baae-40ec-834f-18a690b91366",
  "result": {
    "elements": [
      {
        "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
        "meta": "{\"backend_path\":\"/chime/backend\",\"image_cache_path\":\"/chime/cache\"}",
        "cluster_name": "Default",
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2023-06-25T19:10:18Z",
        "description": "local storage pool2aa",
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

```
chimecli storage_pool createStoragePool --help
create a storage pool

Usage:
  chimecli storage_pool createStoragePool [flags]

Flags:
      --AzUuid string                                 Required. the AZ's uuid
      --Body string                                   Optional json string for [Body]. the http post body
      --ClusterUuid string                            Required. the cluster's uuid
      --createStoragePoolRequest.Description string   description for the storage pool
      --createStoragePoolRequest.Meta string          the meta information about the details of the storage pool
      --createStoragePoolRequest.Name string          Required. the storage pool's name
      --createStoragePoolRequest.PhysicalSize int     Required. the physical size of the storage
      --createStoragePoolRequest.ReservedSize int     the reserverd storage size, which will not be allocated to virtual machines.
      --createStoragePoolRequest.SizeRatio float32    the storage's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical storage
      --createStoragePoolRequest.Type int             the storage pool's type, 0: local, 1:iscsi, 2:ceph
  -h, --help                                          help for createStoragePool

```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|body|[CreateStoragePoolRequest](#schemacreatestoragepoolrequest)|false|the http post body|

**CreateStoragePoolRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createStoragePoolRequest.Description|string|false|description for the storage pool|
|createStoragePoolRequest.Meta|string|true|the meta information about the details of the storage pool|
|createStoragePoolRequest.Name|string|true|the storage pool's name|
|createStoragePoolRequest.PhysicalSize|integer|true|the physical size of the storage|
|createStoragePoolRequest.ReservedSize|integer|false|the reserverd storage size, which will not be allocated to virtual machines.|
|createStoragePoolRequest.SizeRatio|float|false|the storage's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical storage|
|createStoragePoolRequest.Type|integer|false|the storage pool's type, 0: local, 1:iscsi, 2:ceph|

#### 示例

命令行:

```
chimecli storage_pool createStoragePool \
  --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774 \
  --createStoragePoolRequest.Meta '{"backend_path":"/chime/backend","image_cache_path":"/chime/cache"}' \
  --createStoragePoolRequest.Name new-storagepool \
  --createStoragePoolRequest.PhysicalSize 1048576000 \
  --createStoragePoolRequest.ReservedSize 0 \
  --createStoragePoolRequest.SizeRatio 2 \
  --createStoragePoolRequest.Type 0
```

返回:

```
{
  "requestId": "a195c04a-9c69-422c-af78-aa87872b20f0",
  "result": {
    "storage_pool": {
      "az_uuid": "",
      "cluster_name": "",
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-05-12T02:42:24.744396665Z",
      "description": "",
      "meta": "{\"backend_path\":\"/chime/backend\",\"image_cache_path\":\"/chime/cache\"}",
      "name": "new-storagepool",
      "physical_size": 1048576000,
      "reserved_size": 0,
      "state": 1,
      "total_size": 2097152000,
      "type": 0,
      "used_size": 0,
      "uuid": "3b3cb1d6-b84e-4633-8cb1-5e6b4969c0fb"
    }
  }
}
```

### 查看存储池

#### 命令原型

```
chimecli storage_pool getStoragePool --help
get a storage pool's detailed information

Usage:
  chimecli storage_pool getStoragePool [flags]

Flags:
      --AzUuid string            Required. the AZ's uuid
      --ClusterUuid string       Required. the cluster's uuid
      --StoragePoolUuid string   Required. the storage pool's uuid
  -h, --help                     help for getStoragePool
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|StoragePoolUuid|string|true|the storage pool's uuid|

#### 示例

命令行:

```
chimecli storage_pool getStoragePool --StoragePoolUuid 97329a52-44c4-44ac-af4f-fb45c95b618b
```

返回:

```
{
  "requestId": "f50f9372-da7d-41c5-8cc9-713a8dcd492c",
  "result": {
    "storage_pool": {
      "meta": "{\"backend_path\":\"/chime/backend\",\"image_cache_path\":\"/chime/cache\"}",
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "cluster_name": "Default",
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-04-18T07:29:08Z",
      "description": "",
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

```
chimecli storage_pool updateStoragePool --help
update a storage pool

Usage:
  chimecli storage_pool updateStoragePool [flags]

Flags:
      --AzUuid string                                    Required. the AZ's uuid
      --Body string                                      Optional json string for [Body]. the http post body
      --ClusterUuid string                               Required. the cluster's uuid
      --StoragePoolUuid string                           Required. the storage pool's uuid
  -h, --help                                             help for updateStoragePool
      --updateStoragePoolRequest.Description string      description for the storage pool
      --updateStoragePoolRequest.Meta string             the meta information about the details of the storage pool
      --updateStoragePoolRequest.Name string             Required. the storage pool's name
      --updateStoragePoolRequest.PhysicalSize int        Required. the physical size of the storage
      --updateStoragePoolRequest.ReservedSize int        the reserverd storage size, which will not be allocated to virtual machines.
      --updateStoragePoolRequest.SizeRatio float32       the storage's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical storage
      --updateStoragePoolRequest.Type int                the storage pool's type, 0: local, 1:iscsi, 2:ceph

```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|StoragePoolUuid|string|true|the storage pool's uuid|
|body|[UpdateStoragePoolRequest](#schemaupdatestoragepoolrequest)|false|the http post body|

**UpdateStoragePoolRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|updateStoragePoolRequest.Description|string|false|description for the storage pool|
|updateStoragePoolRequest.Meta|string|false|the meta information about the details of the storage pool|
|updateStoragePoolRequest.Name|string|true|the storage pool's name|
|updateStoragePoolRequest.PhysicalSize|integer|true|the physical size of the storage|
|updateStoragePoolRequest.ReservedSize|integer|false|the reserverd storage size, which will not be allocated to virtual machines.|
|updateStoragePoolRequest.SizeRatio|float|false|the storage's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical storage|
|updateStoragePoolRequest.Type|integer|false|the storage pool's type, 0: local, 1:iscsi, 2:ceph|

#### 示例

命令行:

```
chimecli storage_pool updateStoragePool \
  --StoragePoolUuid 97329a52-44c4-44ac-af4f-fb45c95b618b \
  --updateStoragePoolRequest.Meta '{"backend_path":"/chime/backend","image_cache_path":"/chime/cache"}' \
  --updateStoragePoolRequest.PhysicalSize 104857600 \
  --updateStoragePoolRequest.SizeRatio 3 \
  --updateStoragePoolRequest.Type 0 \
  --updateStoragePoolRequest.Name new-storagepool
```

返回:

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

```
chimecli storage_pool deleteStoragePool --help
delete a storage pool

Usage:
  chimecli storage_pool deleteStoragePool [flags]

Flags:
      --AzUuid string            Required. the AZ's uuid
      --ClusterUuid string       Required. the cluster's uuid
      --StoragePoolUuid string   Required. the storage pool's uuid
  -h, --help 
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|StoragePoolUuid|string|true|the storage pool's uuid|

#### 示例

命令行:

```
chimecli storage_pool deleteStoragePool --StoragePoolUuid 97329a52-44c4-44ac-af4f-fb45c95b618b
```

返回:

```
{
  "requestId": "a76eed93-e64f-4ce7-8bad-acd2e1fd52fa",
  "result": 1
}
```

## 镜像相关命令

### 镜像列表

#### 命令原型

```
chimecli image listImage --help
list images

Usage:
  chimecli image listImage [flags]

Flags:
      --bucket_uuid string   filter by the 'bucket_uuid' field
      --format string        filter by the 'format' field
  -h, --help                 help for listImage
      --name string          filter by the 'name' field
      --order string         'asc' or 'desc' of sorting
      --os_type string       filter by the 'os_type' field
      --page int             the page number of the results in paging
      --size int             the page size of the results in paging
      --sort string          the field to be sorted by
      --state string         filter by the 'state' field
      --type int             filter by the 'type' field
      --uuid string          filter by the 'uuid' field
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|state|string|false|filter by the 'state' field|
|format|string|false|filter by the 'format' field|
|os_type|string|false|filter by the 'os_type' field|
|type|integer|false|filter by the 'type' field|
|uuid|string|false|filter by the 'uuid' field|
|bucket_uuid|string|false|filter by the 'bucket_uuid' field|

#### 示例

命令行:

```
chimecli image listImage
```

返回: 

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

```
chimecli image createPublicImage --help
create a public image

Usage:
  chimecli image createPublicImage [flags]

Flags:
      --Body string                             Optional json string for [Body]. the http body of the post request
      --createImageRequest.BootType string      the boot type of the image, can be UEFI or legacy
      --createImageRequest.Description string   description for the image
      --createImageRequest.Format string        the image's format, like raw, qcow2, ...
      --createImageRequest.InstallUrl string    Required. the installation uri of the image to be fetched, it can be a sftp url or a file local path in the server's running node
      --createImageRequest.Name string          Required. the image's name
      --createImageRequest.OsArch string        the architecture of the OS, like x86_64, arm, ...
      --createImageRequest.OsDetail string      the version of the OS, like CentOS 7, CentOS 8, ...
      --createImageRequest.OsType string        the operation system's type, like Windows, Linux, ...
      --createImageRequest.Shared int           whether the image is shared with other accounts or not
  -h, --help                                    help for createPublicImage
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|body|[CreateImageRequest](#schemacreateimagerequest)|false|the http body of the post request|

**CreateImageRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createImageRequest.BootType|string|false|the boot type of the image, can be UEFI or legacy|
|createImageRequest.Description|string|false|description for the image|
|createImageRequest.Format|string|false|the image's format, like raw, qcow2, ...|
|createImageRequest.InstallUrl|string|true|the installation uri of the image to be fetched, it can be a sftp url or a file local path in the server's running node|
|createImageRequest.Name|string|true|the image's name|
|createImageRequest.OsArch|string|false|the architecture of the OS, like x86_64, arm, ...|
|createImageRequest.OsDetail|string|false|the version of the OS, like CentOS 7, CentOS 8, ...|
|createImageRequest.OsType|string|false|the operation system's type, like Windows, Linux, ...|
|createImageRequest.Shared|integer|false|whether the image is shared with other accounts or not|

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

返回:

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

```
chimecli image createUserImage --help
create a user's private image

Usage:
  chimecli image createUserImage [flags]

Flags:
      --Body string                             Optional json string for [Body]. the http body of the post request
      --createImageRequest.BootType string      the boot type of the image, can be UEFI or legacy
      --createImageRequest.Description string   description for the image
      --createImageRequest.Format string        the image's format, like raw, qcow2, ...
      --createImageRequest.InstallUrl string    Required. the installation uri of the image to be fetched, it can be a sftp url or a file local path in the server's running node
      --createImageRequest.Name string          Required. the image's name
      --createImageRequest.OsArch string        the architecture of the OS, like x86_64, arm, ...
      --createImageRequest.OsDetail string      the version of the OS, like CentOS 7, CentOS 8, ...
      --createImageRequest.OsType string        the operation system's type, like Windows, Linux, ...
      --createImageRequest.Shared int           whether the image is shared with other accounts or not
  -h, --help   
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|body|[CreateImageRequest](#schemacreateimagerequest)|false|the http body of the post request|

**CreateImageRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createImageRequest.BootType|string|false|the boot type of the image, can be UEFI or legacy|
|createImageRequest.Description|string|false|description for the image|
|createImageRequest.Format|string|false|the image's format, like raw, qcow2, ...|
|createImageRequest.InstallUrl|string|true|the installation uri of the image to be fetched, it can be a sftp url or a file local path in the server's running node|
|createImageRequest.Name|string|true|the image's name|
|createImageRequest.OsArch|string|false|the architecture of the OS, like x86_64, arm, ...|
|createImageRequest.OsDetail|string|false|the version of the OS, like CentOS 7, CentOS 8, ...|
|createImageRequest.OsType|string|false|the operation system's type, like Windows, Linux, ...|
|createImageRequest.Shared|integer|false|whether the image is shared with other accounts or not|

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

返回:

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

```
chimecli image getImage --help
get an image's detailed information

Usage:
  chimecli image getImage [flags]

Flags:
      --ImageUuid string   Required. the image's uuid
  -h, --help               help for getImage
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|ImageUuid|string|true|the image's uuid|

#### 示例

命令行:

```
chimecli image getImage --ImageUuid fb11078f-8af8-4247-adfe-295459f29646
```

返回:

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

```
chimecli image updateImage --help
update an image's information

Usage:
  chimecli image updateImage [flags]

Flags:
      --Body string                             Optional json string for [Body]. the http body of the post request
      --ImageUuid string                        Required. 
  -h, --help                                    help for updateImage
      --updateImageRequest.BootType string      the boot type of the image, can be UEFI or legacy
      --updateImageRequest.Description string   description for the image
      --updateImageRequest.Format string        the image's format, like raw, qcow2, ...
      --updateImageRequest.Name string          Required. the image's name
      --updateImageRequest.OsArch string        the architecture of the OS, like x86_64, arm, ...
      --updateImageRequest.OsDetail string      the version of the OS, like CentOS 7, CentOS 8, ...
      --updateImageRequest.OsType string        the operation system's type, like Windows, Linux, ...
      --updateImageRequest.Shared int           whether the image is shared with other accounts or not
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|ImageUuid|string|true||
|body|[UpdateImageRequest](#schemaupdateimagerequest)|false|the http body of the post request|

**UpdateImageRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|updateImageRequest.BootType|string|false|the boot type of the image, can be UEFI or legacy|
|updateImageRequest.Description|string|false|description for the image|
|updateImageRequest.Format|string|false|the image's format, like raw, qcow2, ...|
|updateImageRequest.Name|string|true|the image's name|
|updateImageRequest.OsArch|string|false|the architecture of the OS, like x86_64, arm, ...|
|updateImageRequest.OsDetail|string|false|the version of the OS, like CentOS 7, CentOS 8, ...|
|updateImageRequest.OsType|string|false|the operation system's type, like Windows, Linux, ...|
|updateImageRequest.Shared|integer|false|whether the image is shared with other accounts or not|

#### 示例

命令行:

```
chimecli image updateImage \
    --ImageUuid fb11078f-8af8-4247-adfe-295459f29646 \
    --updateImageRequest.Name centos-test
```

返回:

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

```
chimecli image deleteImage --help
delete an image

Usage:
  chimecli image deleteImage [flags]

Flags:
      --ImageUuid string   Required. the image's uuid
  -h, --help               help for deleteImage
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|ImageUuid|string|true|the image's uuid|

#### 示例

命令行:

```
chimecli image deleteImage --ImageUuid fb11078f-8af8-4247-adfe-295459f29646
```

返回:

```
{
  "requestId": "8c6fbd16-83a3-47f7-a10f-b0f5ab76f74c",
  "result": 0
}
```

### 镜像源列表

#### 命令原型

```
chimecli image listImageBucket --help
list image buckets

Usage:
  chimecli image listImageBucket [flags]

Flags:
  -h, --help           help for listImageBucket
      --name string    filter by the 'name' field
      --order string   'asc' or 'desc' of sorting
      --page int       the page number of the results in paging
      --size int       the page size of the results in paging
      --sort string    the field to be sorted by
      --state int      filter by the 'state' field
      --type int       filter by the 'type' field
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
|type|integer|false|filter by the 'type' field|

#### 示例

命令行:

```
chimecli image listImageBucket
```

返回:

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

```
chimecli image getImageBucket --help
get an image bucket's detailed information

Usage:
  chimecli image getImageBucket [flags]

Flags:
      --ImageBucketUuid string   Required. the image bucket's uuid
  -h, --help                     help for getImageBucket
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|ImageBucketUuid|string|true|the image bucket's uuid|

#### 示例

命令行:

```
chimecli image getImageBucket --ImageBucketUuid 9c15f4cb-5f6d-4e45-818f-a4315c54240c
```

返回:

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

```
chimecli alert listAlert --help
list alerts

Usage:
  chimecli alert listAlert [flags]

Flags:
  -h, --help           help for listAlert
      --name string    filter by the 'name' field
      --order string   'asc' or 'desc' of sorting
      --page int       the page number of the results in paging
      --priority int   filter by the 'priority' field
      --severity int   filter by the 'severity' field
      --size int       the page size of the results in paging
      --sort string    the field to be sorted by
      --state int      filter by the 'state' field
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
|severity|integer|false|filter by the 'severity' field|
|priority|integer|false|filter by the 'priority' field|

#### 示例

命令行:

```
chimecli alert listAlert
```

返回:

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

```
chimecli alert getAlert --help
get an alert's detailed information

Usage:
  chimecli alert getAlert [flags]

Flags:
      --AlertUuid string   Required. the alert's UUID
  -h, --help               help for getAlert
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AlertUuid|string|true|the alert's UUID|

#### 示例

命令行:

```
chimecli alert getAlert --AlertUuid e1be82ff-6067-4644-8e40-dac1a7b9b86e
```

返回:

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

```
chimecli alert acceptAlert --help
accept an alert

Usage:
  chimecli alert acceptAlert [flags]

Flags:
      --AlertUuid string                    Required. 
      --Body string                         Optional json string for [Body]. the http body of the post request
      --acceptAlertRequest.Comment string   comment for the alert's acception
  -h, --help                                help for acceptAlert
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AlertUuid|string|true||
|body|[AcceptAlertRequest](#schemaacceptalertrequest)|false|the http body of the post request|

**AcceptAlertRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|acceptAlertRequest.Comment|string|false|comment for the alert's acception|

#### 示例

命令行:

```
chimecli alert acceptAlert \
  --AlertUuid e1be82ff-6067-4644-8e40-dac1a7b9b86e \
  --acceptAlertRequest.Comment "accepted"
```

返回:

```
{
  "requestId": "799f65c8-dd20-4b4c-94f9-0cdc92bd8119",
  "result": "ok"
}
```

### 删除报警

#### 命令原型

```
chimecli alert deleteAlert --help
delete an alert

Usage:
  chimecli alert deleteAlert [flags]

Flags:
      --AlertUuid string   Required. the alert's UUID
  -h, --help               help for deleteAlert
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AlertUuid|string|true|the alert's UUID|

#### 示例

命令行:

```
chimecli alert deleteAlert --AlertUuid c24f4240-6e5e-418b-911f-fa46fe173888
```

返回:

```
{
  "requestId": "9a59e8a7-4c9f-4a8b-9c4f-1676c057274a",
  "result": 0
}
```

### 查看报警规则列表

#### 命令原型

```
chimecli alert listAlertRule --help
list alert rules

Usage:
  chimecli alert listAlertRule [flags]

Flags:
  -h, --help           help for listAlertRule
      --name string    filter by the 'name' field
      --order string   'asc' or 'desc' of sorting
      --page int       the page number of the results in paging
      --priority int   filter by the 'priority' field
      --severity int   filter by the 'severity' field
      --size int       the page size of the results in paging
      --sort string    the field to be sorted by
      --state int      filter by the 'state' field
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
|severity|integer|false|filter by the 'severity' field|
|priority|integer|false|filter by the 'priority' field|

#### 示例

命令行:

```
chimecli alert listAlertRule
```

返回:

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

```
chimecli alert getAlertRule --help
get an alert rule's detailed information

Usage:
  chimecli alert getAlertRule [flags]

Flags:
      --RuleUuid string   Required. the alert rule's UUID
  -h, --help              help for getAlertRule
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|RuleUuid|string|true|the alert rule's UUID|

#### 示例

命令行:

```
chimecli alert getAlertRule --RuleUuid 62deb6e7-6d56-11ee-b5ce-000c29dc11fc
```

返回:

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

```
chimecli compute listVm --help
list virtual machines

Usage:
  chimecli compute listVm [flags]

Flags:
      --az_uuid string        filter by the 'az_uuid' field
      --cluster_uuid string   filter by the 'cluster_uuid' field
  -h, --help                  help for listVm
      --host_uuid string      filter by the 'host_uuid' field
      --name string           filter by the 'name' field
      --order string          'asc' or 'desc' of sorting
      --page int              the page number of the results in paging
      --size int              the page size of the results in paging
      --sort string           the field to be sorted by
      --state string          filter by the 'state' field
      --uuid string           filter by the 'uuid' field
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|state|string|false|filter by the 'state' field|
|uuid|string|false|filter by the 'uuid' field|
|host_uuid|string|false|filter by the 'host_uuid' field|
|az_uuid|string|false|filter by the 'az_uuid' field|
|cluster_uuid|string|false|filter by the 'cluster_uuid' field|

#### 示例

命令行:

```
chimecli compute listVm --state 1
```

返回:

```
{
  "requestId": "81817f91-f300-4bdf-a6f6-c98d70485094",
  "result": {
    "elements": [
      {
        "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
        "boot_type": "",
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2024-06-22T07:55:38Z",
        "description": "",
        "host_ip": "",
        "host_name": "",
        "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
        "hyper_type": "",
        "image_name": "",
        "last_operation_created_at": "2024-06-22T07:55:38Z",
        "last_operation_finished_at": "2024-06-22T07:56:20Z",
        "last_operation_name": "create",
        "last_operation_state": 1,
        "memory": 1073741824,
        "name": "vm-ceph",
        "nics": [],
        "operation": "",
        "os_arch": "",
        "os_detail": "",
        "os_type": "",
        "spec_type": 0,
        "state": 1,
        "tags": null,
        "tasks": [],
        "uuid": "2fc99bf7-7f78-4a07-b7d6-471f3b0b5001",
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

```
chimecli compute createVm --help
create a virtual machine

Usage:
  chimecli compute createVm [flags]

Flags:
      --Body string                                   Optional json string for [Body]. the http post body
      --createVmRequest.AzUuid string                 Required. the AZ's uuid
      --createVmRequest.ClusterUuid string            Required. the cluster's uuid
      --createVmRequest.Description string            description for the virtual machine
      --createVmRequest.HostUuid string               the host's uuid
      --createVmRequest.InstanceSpecUuid string       Required. the instace specification's uuid
      --createVmRequest.Name string                   Required. the virtual machine's name
      --createVmRequest.Password string               the SSH password of the root user
      --createVmRequest.VncPassword string            the VNC password
      --createVmRequest.cdrom.Bootable int            whether to boot the VM from the cdrom, default is 0 (not)
      --createVmRequest.cdrom.HostUuid string         the host's uuid
      --createVmRequest.cdrom.ImageUuid string        Required. the image's uuid
      --createVmRequest.cdrom.Name string             Required. the cdrom's name
      --createVmRequest.cdrom.VolumeSpecUuid string   Required. the volume specification's Uuid
  -h, --help 
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|body|[CreateVmRequest](#schemacreatevmrequest)|false|the http post body|

**CreateVmRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|az_uuid|string|true|the AZ's uuid|
|cdrom|[CreateCdromRequest](#schemacreatecdromrequest)|false|the cdrom of the virtual machine|
|cluster_uuid|string|true|the cluster's uuid|
|description|string|false|description for the virtual machine|
|host_uuid|string|false|the host's uuid|
|instance_spec_uuid|string|true|the instace specification's uuid|
|name|string|true|the virtual machine's name|
|nics|[[CreateNicRequest](#schemacreatenicrequest)]|true|the network interfaces of the virtual machine|
|password|string|false|the SSH password of the root user|
|vnc_password|string|false|the VNC password|
|volumes|[[CreateVolumeRequest](#schemacreatevolumerequest)]|true|the volumes of the virutal machine|

**CreateCdromRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createCdromRequest.Bootable|integer|false|whether to boot the VM from the cdrom, default is 0 (not)|
|createCdromRequest.HostUuid|string|false|the host's uuid|
|createCdromRequest.ImageUuid|string|true|the image's uuid|
|createCdromRequest.Name|string|true|the cdrom's name|
|createCdromRequest.VolumeSpecUuid|string|true|the volume specification's Uuid|

**CreateNicRequest参数**: 

|Name|Type|Required|Description|
|---|---|---|---|
|createNicRequest.Description|string|false|description for the nic|
|createNicRequest.Ip|string|false|the IP address of the nic|
|createNicRequest.Name|string|true|the virtual network interface's name|
|createNicRequest.Primary|integer|false|whether the nic is the primary nic, which can not be removed from a virtual machine|
|createNicRequest.SubnetUuid|string|true|the subnet's Uuid, which the nic belongs to|

**CreateVolumeRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createVolumeRequest.Description|string|false|description for the volume|
|createVolumeRequest.HostUuid|string|false|the host's uuid if the volume is on local storage|
|createVolumeRequest.ImageUuid|string|false|the image's uuid|
|createVolumeRequest.Name|string|true|the volume's name|
|createVolumeRequest.Root|integer|false|whether the volume is the root volume, which is not removable|
|createVolumeRequest.Size|integer|true|the size of the volume in bytes|
|createVolumeRequest.VolumeSpecUuid|string|true|the volume specification's Uuid|


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

返回:

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

```
chimecli compute describeVm --help
get a virtual machine's detailed information

Usage:
  chimecli compute describeVm [flags]

Flags:
      --VmUuid string   Required. the virtual machine's uuid
  -h, --help            help for describeVm
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VmUuid|string|true|the virtual machine's uuid|

#### 示例

命令行:

```
chimecli compute describeVm --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77
```

返回:

```
{
  "requestId": "95ef4dfa-fc3f-43f0-8fbe-30c34fe2f85a",
  "result": {
    "vm": {
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "boot_type": "bios",
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-06-22T07:55:38Z",
      "description": "",
      "host_ip": "192.168.231.128",
      "host_name": "host-a428263d",
      "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
      "hyper_type": "",
      "image_name": "centos7_cloudinit.qcow2",
      "last_operation_created_at": null,
      "last_operation_finished_at": null,
      "last_operation_name": "",
      "last_operation_state": 0,
      "memory": 1073741824,
      "name": "vm-ceph",
      "nics": [
        {
          "attached_vms": [],
          "created_at": "2024-06-22T07:55:41Z",
          "description": "",
          "gateway": "192.168.231.2",
          "ip": "192.168.231.0",
          "last_operation_created_at": null,
          "last_operation_finished_at": null,
          "last_operation_name": "",
          "last_operation_state": 0,
          "mac": "52:54:00:0e:33:55",
          "name": "primary-nic-vm-ceph",
          "netmask": "255.255.255.0",
          "network_name": "br1",
          "network_type": 0,
          "operation": "",
          "primary": 1,
          "state": 2,
          "subnet_cidr": "192.168.231.1/24",
          "subnet_name": "Subnet1",
          "subnet_uuid": "f76a3110-1e8e-4094-84e8-a168d27b895b",
          "tasks": [],
          "uuid": "52f217a1-019f-4de8-8dfa-97a8cc503c00"
        }
      ],
      "operation": "",
      "os_arch": "x86_64",
      "os_detail": "CentOS 7.x",
      "os_type": "CentOS",
      "spec_type": 0,
      "state": 1,
      "tags": null,
      "tasks": [
        {
          "created_at": "2024-06-22T07:55:38Z",
          "description": "create-vm-flowchain",
          "finished_at": "2024-06-22T07:56:20Z",
          "operation_name": "create",
          "request_id": "ec7a5745-a71f-408c-bd33-da0bc3d8c326",
          "resource_type": "vm",
          "resource_uuid": "2fc99bf7-7f78-4a07-b7d6-471f3b0b5001",
          "state": 1,
          "updated_at": "2024-06-22T07:56:20Z",
          "uuid": "706d79d2-2dce-48dc-8e68-e931187696b6"
        }
      ],
      "uuid": "2fc99bf7-7f78-4a07-b7d6-471f3b0b5001",
      "vcpus": 1,
      "volumes": [
        {
          "attached_vms": [],
          "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
          "cdrom": 0,
          "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
          "created_at": "2024-06-22T07:55:38Z",
          "description": "",
          "format": "qcow2",
          "host_ip": "",
          "host_name": "",
          "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
          "image_name": "centos7_cloudinit.qcow2",
          "image_uuid": "700fb68a-382a-48be-a7f7-7114559c2f2e",
          "iops": 2000,
          "last_operation_created_at": null,
          "last_operation_finished_at": null,
          "last_operation_name": "",
          "last_operation_state": 0,
          "name": "root-volume-vm-ceph",
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
          "tasks": [],
          "throughput": 209715200,
          "type": 2,
          "user_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
          "uuid": "0c53842d-77d8-4f9e-8b9b-0ab870a081d3",
          "version": 0,
          "volume_spec_uuid": "30b84c1e-2044-43d3-932b-569742fd44c3"
        }
      ]
    }
  }
}
```

### 启动虚拟机

#### 命令原型

```
chimecli compute startVm --help
start a virtual machine

Usage:
  chimecli compute startVm [flags]

Flags:
      --VmUuid string   Required. the virtual machine's uuid
  -h, --help            help for startVm
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VmUuid|string|true|the virtual machine's uuid|

#### 示例

命令行:

```
chimecli compute startVm --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77
```

返回:

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

```
chimecli compute stopVm --help
stop a virtual machine

Usage:
  chimecli compute stopVm [flags]

Flags:
      --VmUuid string   Required. the virtual machine's uuid
  -h, --help            help for stopVm
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VmUuid|string|true|the virtual machine's uuid|

#### 示例

命令行:

```
chimecli compute stopVm --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77
```

返回:

```
{
  "requestId": "ab8daf9f-e4ad-4c1d-b5bc-58bfb4b1ed43",
  "result": {
    "vm": "ok"
  }
}
```


### 迁移虚拟机

#### 命令原型

```
chimecli compute migrateVm --help
migrate a virtual machine to another host

Usage:
  chimecli compute migrateVm [flags]

Flags:
      --Body string                              Optional json string for [Body]. the http post body
      --VmUuid string                            Required. the virtual machine's uuid
  -h, --help                                     help for migrateVm
      --vmMigrateRequest.CopyLocalSnapshots      whether to copy all local snapshots to the target host prior to triggering the migration process, becasue the local snapshots are not migratable
      --vmMigrateRequest.MergeLocalSnapshots     whether to merge all local snapshots prior to triggering the migration process, becasue the local snapshots are not migratable
      --vmMigrateRequest.MigrateLocalDisks       setting it to true to migrate local disks, by default a vm contains non-shared disks is not migratable, but if the local disk has local external snapshots, it is not migratable as well, you need to set the "merge_snapshots" option to true
      --vmMigrateRequest.TargetHostUuid string   the target host's uuid, system will automatically assign one host if omit
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VmUuid|string|true|the virtual machine's uuid|
|vmMigrateRequest.TargetHostUuid|string|false|the target host's uuid, system will automatically assign one host if omit|
|vmMigrateRequest.MigrateLocalDisks|bool|false|setting it to true to migrate local disks, by default a vm contains non-shared disks is not migratable, but if the local disk has local external snapshots, it is not migratable as well, you need to set the "merge_snapshots" option to true|
|vmMigrateRequest.CopyLocalSnapshots|bool|false|whether to copy all local snapshots to the target host prior to triggering the migration process, becasue the local snapshots are not migratable|
|vmMigrateRequest.MergeLocalSnapshots|bool|false|whether to merge all local snapshots prior to triggering the migration process, becasue the local snapshots are not migratable|

#### 示例

命令行:

```
chimecli compute migrateVm \
  --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77 \
  --vmMigrateRequest.TargetHostUuid 12345678-1112-449d-8d3e-3ff8b1323d9e  \
  --vmMigrateRequest.MigrateLocalDisks \
  --vmMigrateRequest.CopyLocalSnapshots
```

返回:

```
{
  "requestId": "f4f02ee8-8407-4a8c-a217-a9ee2b643b6b",
  "result": {
    "vm": "ok"
  }
}
```
### 更新虚拟机

#### 命令原型

```
chimecli compute updateVm --help
update a virtual machine

Usage:
  chimecli compute updateVm [flags]

Flags:
      --Body string                          Optional json string for [Body]. the http post body
      --VmUuid string                        Required. the virtual machine's uuid
  -h, --help                                 help for updateVm
      --updateVmRequest.Description string   description for the virutal machine
      --updateVmRequest.Name string          the virutal machine's name
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VmUuid|string|true|the virtual machine's uuid|
|body|[UpdateVmRequest](#schemaupdatevmrequest)|false|the http post body|

**UpdateVmRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|updateVmRequest.Description|string|false|description for the virutal machine|
|updateVmRequest.Name|string|false|the virutal machine's name|

#### 示例

命令行:

```
chimecli compute updateVm \
  --VmUuid 4be21239-293c-4989-b637-4df104f17caf \
  --updateVmRequest.Name test-vm
```

返回:

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

```
chimecli compute deleteVm --help
delete a virtual machine

Usage:
  chimecli compute deleteVm [flags]

Flags:
      --VmUuid string      Required. the virtual machine's uuid
      --force_del string   if forceDel is set to true, the physical volumes are deleted as well as the virtual machine
  -h, --help               help for deleteVm
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VmUuid|string|true|the virtual machine's uuid|
|force_del|string|false|if forceDel is set to true, the physical volumes are deleted as well as the virtual machine|

#### 示例

命令行:

```
chimecli compute deleteVm --VmUuid 4be21239-293c-4989-b637-4df104f17caf
```

返回:

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

```
chimecli volume listVolume --help
list volumes

Usage:
  chimecli volume listVolume [flags]

Flags:
      --AzUuid string        Required. filter by AZ's uuid
      --ClusterUuid string   Required. filter by cluster's uuid
  -h, --help                 help for listVolume
      --host_uuid string     filter by host's uuid
      --name string          filter by the 'name' field
      --order string         'asc' or 'desc' of sorting
      --page int             the page number of the results in paging
      --size int             the page size of the results in paging
      --sort string          the field to be sorted by
      --state string         filter by the 'state' field
      --uuid string          filter by volume's uuid
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|state|string|false|filter by the 'state' field|
|uuid|string|false|filter by volume's uuid|
|host_uuid|string|false|filter by host's uuid|
|AzUuid|string|true|filter by AZ's uuid|
|ClusterUuid|string|true|filter by cluster's uuid|

#### 示例

命令行:

```
chimecli volume listVolume --state 2
```

返回:

```
{
  "requestId": "1138b36d-e86d-4523-b533-5e40afef0c37",
  "result": {
    "elements": [
      {
        "attached_vms": [],
        "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
        "cdrom": 0,
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2024-06-22T10:50:56Z",
        "description": "",
        "format": "qcow2",
        "host_ip": "",
        "host_name": "",
        "host_uuid": "12345678-1112-449d-8d3e-3ff8b1323d9e",
        "image_name": "",
        "image_uuid": "700fb68a-382a-48be-a7f7-7114559c2f2e",
        "iops": 1000,
        "last_operation_created_at": null,
        "last_operation_finished_at": null,
        "last_operation_name": "",
        "last_operation_state": 0,
        "name": "root-volume-vm-local",
        "operation": "",
        "parent_version": 1,
        "root": 1,
        "size": 21474836480,
        "snapshot_count": 2,
        "snapshots": [],
        "spec_name": "Standard",
        "state": 2,
        "storage_pool_name": "Local Storage Pool",
        "storage_pool_type": 0,
        "tasks": [],
        "throughput": 20971520,
        "type": 0,
        "user_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
        "uuid": "6a8a26ab-4aa9-41c7-9ac4-62a90f905960",
        "version": 2,
        "volume_spec_uuid": "38112d5c-7f13-438a-aec5-d14de51bd30f"
      },
      {
        "attached_vms": [],
        "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
        "cdrom": 0,
        "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
        "created_at": "2024-06-22T07:55:38Z",
        "description": "",
        "format": "qcow2",
        "host_ip": "",
        "host_name": "",
        "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
        "image_name": "",
        "image_uuid": "700fb68a-382a-48be-a7f7-7114559c2f2e",
        "iops": 2000,
        "last_operation_created_at": null,
        "last_operation_finished_at": null,
        "last_operation_name": "",
        "last_operation_state": 0,
        "name": "root-volume-vm-ceph",
        "operation": "",
        "parent_version": -1,
        "root": 1,
        "size": 21474836480,
        "snapshot_count": 0,
        "snapshots": [],
        "spec_name": "Ceph Mini",
        "state": 2,
        "storage_pool_name": "Ceph Pool",
        "storage_pool_type": 2,
        "tasks": [],
        "throughput": 209715200,
        "type": 2,
        "user_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
        "uuid": "0c53842d-77d8-4f9e-8b9b-0ab870a081d3",
        "version": 0,
        "volume_spec_uuid": "30b84c1e-2044-43d3-932b-569742fd44c3"
      }
    ],
    "size": 2,
    "total": 2
  }
}
```

### 新建云硬盘

#### 命令原型

```
chimecli volume createVolume --help
create a volume

Usage:
  chimecli volume createVolume [flags]

Flags:
      --AzUuid string                               Required. the AZ's uuid
      --Body string                                 Optional json string for [Body]. the http post body
      --ClusterUuid string                          Required. the cluster's uuid
      --createVolumeRequest.Description string      description for the volume
      --createVolumeRequest.HostUuid string         the host's uuid if the volume is on local storage
      --createVolumeRequest.ImageUuid string        the image's uuid
      --createVolumeRequest.Name string             Required. the volume's name
      --createVolumeRequest.Root int                whether the volume is the root volume, which is not removable
      --createVolumeRequest.Size int                Required. the size of the volume in bytes
      --createVolumeRequest.VolumeSpecUuid string   Required. the volume specification's Uuid
  -h, --help  
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|body|[CreateVolumeRequest](#schemacreatevolumerequest)|false|the http post body|

**CreateVolumeRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createVolumeRequest.Description|string|false|description for the volume|
|createVolumeRequest.HostUuid|string|false|the host's uuid if the volume is on local storage|
|createVolumeRequest.ImageUuid|string|false|the image's uuid|
|createVolumeRequest.Name|string|true|the volume's name|
|createVolumeRequest.Root|integer|false|whether the volume is the root volume, which is not removable|
|createVolumeRequest.Size|integer|true|the size of the volume in bytes|
|createVolumeRequest.VolumeSpecUuid|string|true|the volume specification's Uuid|

#### 示例

命令行:

```
chimecli volume createVolume \
  --createVolumeRequest.VolumeSpecUuid 38112d5c-7f13-438a-aec5-d14de51bd30f \
  --createVolumeRequest.HostUuid a428263d-64a9-4653-8d7e-556c20c0d77a \
  --createVolumeRequest.Name test-volume \
  --createVolumeRequest.Size 21474836480 \
  --AzUuid cbd2819b-b49a-47ad-9fa4-307774d97865 \
  --ClusterUuid 65bbc21f-0289-4bbf-9517-6b8da9688774
```

返回:

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

```
chimecli volume getVolume --help
get a volume's detailed information

Usage:
  chimecli volume getVolume [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --VolumeUuid string    Required. the volume's uuid
  -h, --help                 help for getVolume
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VolumeUuid|string|true|the volume's uuid|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|

#### 示例

命令行:

```
chimecli volume getVolume --VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f
```

返回:

```
{
  "requestId": "f4f8238d-fdce-4997-84fe-6e588a9354c7",
  "result": {
    "volume": {
      "attached_vms": [
        {
          "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
          "boot_type": "",
          "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
          "created_at": "2024-06-22T07:55:38Z",
          "description": "",
          "host_ip": "",
          "host_name": "",
          "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
          "hyper_type": "",
          "image_name": "",
          "last_operation_created_at": null,
          "last_operation_finished_at": null,
          "last_operation_name": "",
          "last_operation_state": 0,
          "memory": 1073741824,
          "name": "vm-ceph",
          "nics": [],
          "operation": "",
          "os_arch": "",
          "os_detail": "",
          "os_type": "",
          "spec_type": 0,
          "state": 1,
          "tags": null,
          "tasks": [],
          "uuid": "2fc99bf7-7f78-4a07-b7d6-471f3b0b5001",
          "vcpus": 1,
          "volumes": []
        }
      ],
      "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
      "cdrom": 0,
      "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
      "created_at": "2024-06-22T07:55:38Z",
      "description": "",
      "format": "qcow2",
      "host_ip": "192.168.231.128",
      "host_name": "host-a428263d",
      "host_uuid": "a428263d-64a9-4653-8d7e-556c20c0d77a",
      "image_name": "centos7_cloudinit.qcow2",
      "image_uuid": "700fb68a-382a-48be-a7f7-7114559c2f2e",
      "iops": 2000,
      "last_operation_created_at": null,
      "last_operation_finished_at": null,
      "last_operation_name": "",
      "last_operation_state": 0,
      "name": "root-volume-vm-ceph",
      "operation": "",
      "parent_version": -1,
      "root": 1,
      "size": 21474836480,
      "snapshot_count": 0,
      "snapshots": [],
      "spec_name": "Ceph Mini",
      "state": 2,
      "storage_pool_name": "Ceph Pool",
      "storage_pool_type": 2,
      "tasks": [],
      "throughput": 209715200,
      "type": 2,
      "user_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
      "uuid": "0c53842d-77d8-4f9e-8b9b-0ab870a081d3",
      "version": 0,
      "volume_spec_uuid": "30b84c1e-2044-43d3-932b-569742fd44c3"
    }
  }
}
```

### 更新云硬盘

#### 命令原型

```
chimecli volume updateVolume --help
update a volume

Usage:
  chimecli volume updateVolume [flags]

Flags:
      --AzUuid string                            Required. the AZ's uuid
      --Body string                              Optional json string for [Body]. the http post body
      --ClusterUuid string                       Required. the cluster's uuid
      --VolumeUuid string                        Required. the volume's uuid
  -h, --help                                     help for updateVolume
      --updateVolumeRequest.Description string   description for the volume
      --updateVolumeRequest.Name string          the volume's name
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VolumeUuid|string|true|the volume's uuid|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|body|[UpdateVolumeRequest](#schemaupdatevolumerequest)|false|the http post body|

**UpdateVolumeRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|updateVolumeRequest.Description|string|false|description for the volume|
|updateVolumeRequest.Name|string|false|the volume's name|

#### 示例

命令行:

```
chimecli volume updateVolume \
  --VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f \
  --updateVolumeRequest.Name 'test-volume' \
  --updateVolumeRequest.Description 'volume description'
```

返回:

```
{
  "requestId": "ded9e524-20d4-4a45-843b-d6cd13b76ec0",
  "result": {
    "vm": "ok"
  }
}
```

### 删除云硬盘

#### 命令原型

```
chimecli volume deleteVolume --help
delete a volume

Usage:
  chimecli volume deleteVolume [flags]

Flags:
      --AzUuid string        Required. the AZ's uuid
      --ClusterUuid string   Required. the cluster's uuid
      --VolumeUuid string    Required. the volume's uuid
      --force_del string     whether to delete the physical volume in the node
  -h, --help     
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VolumeUuid|string|true|the volume's uuid|
|AzUuid|string|true|the AZ's uuid|
|ClusterUuid|string|true|the cluster's uuid|
|force_del|string|false|whether to delete the physical volume in the node|

#### 示例

命令行:

```
chimecli volume deleteVolume --VolumeUuid 9379b2e5-45dd-4760-84d4-f0a5ce90a0e3
```

返回:

```
{
  "requestId": "bb931734-6051-486b-b0fb-b33f63de2d29",
  "result": 1
}
```

### 挂载云硬盘

#### 命令原型

```
chimecli compute attachVolumeToVm --help
attach a volume to the virtual machine

Usage:
  chimecli compute attachVolumeToVm [flags]

Flags:
      --Body string                             Optional json string for [Body]. the http post body
      --VmUuid string                           Required. the virtual machine's uuid
      --attachVolumeRequest.VolumeUuid string   Required. the virtual machine's uuid
  -h, --help    
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VmUuid|string|true|the virtual machine's uuid|
|body|[AttachVolumeRequest](#schemaattachvolumerequest)|false|the http post body|

**AttachVolumeRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|attachVolumeRequest.VolumeUuid|string|true|the virtual machine's uuid|

#### 示例

命令行:

```
chimecli compute attachVolumeToVm \
  --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77 \
  --attachVolumeRequest.VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f
```

返回: 
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

```
chimecli compute detachVolumeFromVm --help
detach a volume from the virtual machine

Usage:
  chimecli compute detachVolumeFromVm [flags]

Flags:
      --Body string                             Optional json string for [Body]. the http post body
      --VmUuid string                           Required. the virtual machine's uuid
      --detachVolumeRequest.VolumeUuid string   Required. the virtual machine's uuid
  -h, --help                                    help for detachVolumeFromVm
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VmUuid|string|true|the virtual machine's uuid|
|body|[DetachVolumeRequest](#schemadetachvolumerequest)|false|the http post body|

**DetachVolumeRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|detachVolumeRequest.VolumeUuid|string|true|the virtual machine's uuid|

#### 示例

命令行:

```
chimecli compute detachVolumeFromVm \
  --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77 \
  --detachVolumeRequest.VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f
```

返回:

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

```
chimecli volume createSnapshot --help
create a snapshot

Usage:
  chimecli volume createSnapshot [flags]

Flags:
      --Body string                                Optional json string for [Body]. the http post body
      --VolumeUuid string                          Required. the volume's uuid
      --createSnapshotRequest.Description string   description for the snapshot
      --createSnapshotRequest.Name string          Required. the snapshot's name
  -h, --help                                       help for createSnapshot

```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VolumeUuid|string|true|the volume's uuid|
|body|[CreateSnapshotRequest](#schemacreatesnapshotrequest)|false|the http post body|

**CreateSnapshotRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createSnapshotRequest.Description|string|false|description for the snapshot|
|createSnapshotRequest.Name|string|true|the snapshot's name|

#### 示例

命令行:

```
chimecli volume createSnapshot \
  --VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f \
  --createSnapshotRequest.Name 'test-snapshot'
```

返回:

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

```
chimecli volume listSnapshot --help
list all snapshots

Usage:
  chimecli volume listSnapshot [flags]

Flags:
  -h, --help           help for listSnapshot
      --name string    filter by the 'name' field
      --order string   'asc' or 'desc' of sorting
      --page int       the page number of the results in paging
      --size int       the page size of the results in paging
      --sort string    the field to be sorted by
      --state string   filter by the 'state' field
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer(int64)|false|the page number of the results in paging|
|size|integer(int64)|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|state|string|false|filter by the 'state' field|

#### 示例

命令行:

```
chimecli volume listVolumeSnapshot --VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f
```

返回:

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

```
chimecli volume getSnapshot --help
get a snapshot's detail information

Usage:
  chimecli volume getSnapshot [flags]

Flags:
      --SnapshotUuid string   Required. the snapshot's uuid
      --VolumeUuid string     Required. the volume's uuid
  -h, --help                  help for getSnapshot
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VolumeUuid|string|true|the volume's uuid|
|SnapshotUuid|string|true|the snapshot's uuid|

#### 示例

命令行:

```
chimecli volume  getSnapshot --SnapshotUuid fec61438-370b-4c19-9333-6ce6ab016e69
```

返回:

```
{
  "requestId": "7922d7d4-201f-4d09-8ad4-6fbb1599117e",
  "result": {
    "snapshot": {
      "created_at": "2024-06-22T10:57:21Z",
      "description": "",
      "last_operation_created_at": "2024-06-22T10:57:21Z",
      "last_operation_finished_at": "2024-06-22T10:57:22Z",
      "last_operation_name": "create",
      "last_operation_state": 1,
      "name": "snap2",
      "operation": "",
      "parent_volume_version": 0,
      "state": 1,
      "tasks": [],
      "user_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
      "uuid": "afef6f3b-45da-467b-a15b-53dc784bd32c",
      "volume_name": "root-volume-vm-local",
      "volume_uuid": "6a8a26ab-4aa9-41c7-9ac4-62a90f905960",
      "volume_version": 1
    }
  }
}
```

### 更新快照

#### 命令原型

```
chimecli volume updateSnapshot --help
update a snapshot

Usage:
  chimecli volume updateSnapshot [flags]

Flags:
      --Body string                                Optional json string for [Body]. the http post body
      --SnapshotUuid string                        Required. the snapshot's uuid
      --VolumeUuid string                          Required. the volume's uuid
  -h, --help                                       help for updateSnapshot
      --updateSnapshotRequest.Description string   description for the snapshot
      --updateSnapshotRequest.Name string          Required. the snapshot's name
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VolumeUuid|string|true|the volume's uuid|
|SnapshotUuid|string|true|the snapshot's uuid|
|body|[UpdateSnapshotRequest](#schemaupdatesnapshotrequest)|false|the http post body|

**UpdateSnapshotRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|updateSnapshotRequest.Description|string|false|description for the snapshot|
|updateSnapshotRequest.Name|string|true|the snapshot's name|

#### 示例

命令行:

```
chimecli volume  updateSnapshot \
  --SnapshotUuid fec61438-370b-4c19-9333-6ce6ab016e69 \
  --createSnapshotRequest.Name 'test-snapshot' \
  --createSnapshotRequest.Description 'snapshot description'
```

返回: 

```
{
  "requestId": "78527034-0b25-416c-b510-2bef0c68d4e2",
  "result": {
    "snapshot": "ok"
  }
}
```

### 从快照恢复到云盘

#### 命令原型

```
chimecli volume restoreVolume --help
restore volume from a snapshot

Usage:
  chimecli volume restoreVolume [flags]

Flags:
      --SnapshotUuid string   Required. the snapshot's uuid
      --VolumeUuid string     Required. the volume's uuid
  -h, --help                  help for restoreVolume

```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VolumeUuid|string|true|the volume's uuid|
|SnapshotUuid|string|true|the snapshot's uuid|

#### 示例

命令行:

```
chimecli volume restoreVolume \
  --SnapshotUuid fec61438-370b-4c19-9333-6ce6ab016e69 \
  --VolumeUuid 134698fb-b6ef-40f0-962c-b47b644e7d1f 
```

返回: 

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

```
chimecli volume deleteSnapshot --help
delete a snapshot

Usage:
  chimecli volume deleteSnapshot [flags]

Flags:
      --SnapshotUuid string   Required. the snapshot's uuid
      --VolumeUuid string     Required. the volume's uuid
  -h, --help                  help for deleteSnapshot
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VolumeUuid|string|true|the volume's uuid|
|SnapshotUuid|string|true|the snapshot's uuid|

#### 示例

命令行:

```
chimecli volume deleteSnapshot --SnapshotUuid fec61438-370b-4c19-9333-6ce6ab016e69
```

返回:

```
{
  "requestId": "3198bfaf-dfb6-478a-8ef7-abf7396372df",
  "result": "ok"
}
```

## 弹性网卡相关命令

### 查看弹性网卡列表

#### 命令原型

```
chimecli network  listNic --help 
list network interfaces

Usage:
  chimecli network listNic [flags]

Flags:
  -h, --help                 help for listNic
      --name string          filter by the 'name' field
      --order string         'asc' or 'desc' of sorting
      --page int             the page number of the results in paging
      --size int             the page size of the results in paging
      --sort string          the field to be sorted by
      --state string         filter by the 'state' field
      --subnet_uuid string   filter by the subnet's uuid
      --uuid string          filter by the network interface's uuid
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|page|integer|false|the page number of the results in paging|
|size|integer|false|the page size of the results in paging|
|sort|string|false|the field to be sorted by|
|order|string|false|'asc' or 'desc' of sorting|
|name|string|false|filter by the 'name' field|
|state|string|false|filter by the 'state' field|
|uuid|string|false|filter by the network interface's uuid|
|subnet_uuid|string|false|filter by the subnet's uuid|

#### 示例

命令行:

```
chimecli network listNic --state 2
```

返回:

```
{
  "requestId": "36834694-3d2a-4a15-b39e-aeed2f02e40f",
  "result": {
    "elements": [
      {
        "attached_vms": [],
        "created_at": "2024-06-22T10:50:56Z",
        "description": "",
        "gateway": "192.168.231.2",
        "ip": "192.168.231.11",
        "last_operation_created_at": null,
        "last_operation_finished_at": null,
        "last_operation_name": "",
        "last_operation_state": 0,
        "mac": "52:54:00:6e:52:be",
        "name": "primary-nic-vm-local",
        "netmask": "255.255.255.0",
        "network_name": "br1",
        "network_type": 0,
        "operation": "",
        "primary": 1,
        "state": 2,
        "subnet_cidr": "192.168.231.1/24",
        "subnet_name": "Subnet1",
        "subnet_uuid": "f76a3110-1e8e-4094-84e8-a168d27b895b",
        "tasks": [],
        "uuid": "1a588665-453b-43d3-b98f-94289e305995"
      },
      {
        "attached_vms": [],
        "created_at": "2024-06-22T07:55:41Z",
        "description": "",
        "gateway": "192.168.231.2",
        "ip": "192.168.231.0",
        "last_operation_created_at": null,
        "last_operation_finished_at": null,
        "last_operation_name": "",
        "last_operation_state": 0,
        "mac": "52:54:00:0e:33:55",
        "name": "primary-nic-vm-ceph",
        "netmask": "255.255.255.0",
        "network_name": "br1",
        "network_type": 0,
        "operation": "",
        "primary": 1,
        "state": 2,
        "subnet_cidr": "192.168.231.1/24",
        "subnet_name": "Subnet1",
        "subnet_uuid": "f76a3110-1e8e-4094-84e8-a168d27b895b",
        "tasks": [],
        "uuid": "52f217a1-019f-4de8-8dfa-97a8cc503c00"
      }
    ],
    "size": 2,
    "total": 2
  }
}
```

### 新建弹性网卡

#### 命令原型

```
chimecli network createNic --help 
create a network interface

Usage:
  chimecli network createNic [flags]

Flags:
      --Body string                           Optional json string for [Body]. the http post body
      --createNicRequest.Description string   description for the nic
      --createNicRequest.Ip string            the IP address of the nic
      --createNicRequest.Name string          Required. the virtual network interface's name
      --createNicRequest.Primary int          whether the nic is the primary nic, which can not be removed from a virtual machine
      --createNicRequest.SubnetUuid string    Required. the subnet's Uuid, which the nic belongs to
  -h, --help                                  help for createNic
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|body|[CreateNicRequest](#schemacreatenicrequest)|false|the http post body|

**CreateNicRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|createNicRequest.Description|string|false|description for the volume|
|createNicRequest.HostUuid|string|false|the host's uuid if the volume is on local storage|
|createNicRequest.ImageUuid|string|false|the image's uuid|
|createNicRequest.Name|string|true|the volume's name|
|createNicRequest.Root|integer|false|whether the volume is the root volume, which is not removable|
|createNicRequest.Size|integer|true|the size of the volume in bytes|
|createNicRequest.VolumeSpecUuid|string|true|the volume specification's Uuid|

#### 示例

命令行:

```
chimecli network createNic \
  --createNicRequest.SubnetUuid e73efdf7-d232-4556-ba95-3851100a47b7 \
  --createNicRequest.Name test-nic
```

返回:

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

```
chimecli network getNic --help 
get a network interface's detailed information

Usage:
  chimecli network getNic [flags]

Flags:
      --NicUuid string   Required. the network interface's uuid
  -h, --help             help for getNic
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|NicUuid|string|true|the network interface's uuid|

#### 示例

命令行:

```
chimecli network getNic --NicUuid 1a588665-453b-43d3-b98f-94289e305995
```

返回:

```
{
  "requestId": "1ba3bc91-ba6a-460d-b69f-76be16a7b859",
  "result": {
    "nic": {
      "attached_vms": [
        {
          "az_uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865",
          "boot_type": "",
          "cluster_uuid": "65bbc21f-0289-4bbf-9517-6b8da9688774",
          "created_at": "2024-06-22T10:50:56Z",
          "description": "",
          "host_ip": "",
          "host_name": "",
          "host_uuid": "12345678-1112-449d-8d3e-3ff8b1323d9e",
          "hyper_type": "",
          "image_name": "",
          "last_operation_created_at": null,
          "last_operation_finished_at": null,
          "last_operation_name": "",
          "last_operation_state": 0,
          "memory": 1073741824,
          "name": "vm-local",
          "nics": [],
          "operation": "",
          "os_arch": "",
          "os_detail": "",
          "os_type": "",
          "spec_type": 0,
          "state": 4,
          "tags": null,
          "tasks": [],
          "uuid": "75392964-db07-44b9-bdf4-1ea509dbdf07",
          "vcpus": 1,
          "volumes": []
        }
      ],
      "created_at": "2024-06-22T10:50:56Z",
      "description": "",
      "gateway": "192.168.231.2",
      "ip": "192.168.231.11",
      "last_operation_created_at": null,
      "last_operation_finished_at": null,
      "last_operation_name": "",
      "last_operation_state": 0,
      "mac": "52:54:00:6e:52:be",
      "name": "primary-nic-vm-local",
      "netmask": "255.255.255.0",
      "network_name": "br1",
      "network_type": 0,
      "operation": "",
      "primary": 1,
      "state": 2,
      "subnet_cidr": "192.168.231.1/24",
      "subnet_name": "Subnet1",
      "subnet_uuid": "f76a3110-1e8e-4094-84e8-a168d27b895b",
      "tasks": [],
      "uuid": "1a588665-453b-43d3-b98f-94289e305995"
    }
  }
}
```

### 更新弹性网卡

#### 命令原型

```
chimecli network updateNic --help 
update a network interface

Usage:
  chimecli network updateNic [flags]

Flags:
      --Body string                           Optional json string for [Body]. the http post body
      --NicUuid string                        Required. the network interface's uuid
  -h, --help                                  help for updateNic
      --updateNicRequest.Description string   description for the nic
      --updateNicRequest.Name string          Required. the nic's name

```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|NicUuid|string|true|the network interface's uuid|
|body|[UpdateNicRequest](#schemaupdatenicrequest)|false|the http post body|

**UpdateNicRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|updateNicRequest.Description|string|false|description for the virutal machine|
|updateNicRequest.Name|string|false|the virutal machine's name|


#### 示例

命令行:

```
chimecli network updateNic \
  --NicUuid 16655315-8684-4e22-bd5f-4d8d30618629 \
  --updateNicRequest.Name 'test-nic-new'
```

返回:

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

```
chimecli network deleteNic --help 
delete a network interface

Usage:
  chimecli network deleteNic [flags]

Flags:
      --NicUuid string     Required. the network interface's uuid
      --force_del string   whether to force delete the network interface from the OS
  -h, --help               help for deleteNic
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|NicUuid|string|true|the network interface's uuid|
|force_del|string|false|whether to force delete the network interface from the OS|

#### 示例

命令行:

```
chimecli network deleteNic --NicUuid 16655315-8684-4e22-bd5f-4d8d30618629
```

返回:

```
{
  "requestId": "3269c569-e2f1-408c-b0e5-06ba7eeadf0f",
  "result": 1
}
```

### 挂载弹性网卡

#### 命令原型

```
chimecli compute attachNicToVm --help 
attach a network interface to the virtual machine

Usage:
  chimecli compute attachNicToVm [flags]

Flags:
      --Body string                       Optional json string for [Body]. the http post body
      --VmUuid string                     Required. the virtual machine's uuid
      --attachNicRequest.NicUuid string   Required. the network interface's uuid
  -h, --help                              help for attachNicToVm
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VmUuid|string|true|the virtual machine's uuid|
|body|[AttachNicRequest](#schemaattachnicrequest)|false|the http post body|

**AttachNicRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|attachNicRequest.NicUuid|string|true|the network interface's uuid|

#### 示例

命令行:

```
chimecli compute attachNicToVm \
  --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77 \
  --attachNicRequest.NicUuid 16655315-8684-4e22-bd5f-4d8d30618629
```

返回:

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

```
chimecli compute detachNicFromVm --help 
detach a network interface from the virtual machine

Usage:
  chimecli compute detachNicFromVm [flags]

Flags:
      --Body string                       Optional json string for [Body]. the http post body
      --VmUuid string                     Required. the virtual machine's uuid
      --detachNicRequest.NicUuid string   Required. the network interface's uuid
  -h, --help                              help for detachNicFromVm
```

#### 参数列表

|Name|Type|Required|Description|
|---|---|---|---|
|VmUuid|string|true|the virtual machine's uuid|
|body|[DetachNicRequest](#schemadetachnicrequest)|false|the http post body|

**DetachNicRequest参数**:

|Name|Type|Required|Description|
|---|---|---|---|
|detachNicRequest.NicUuid|string|true|the network interface's uuid|

#### 示例

命令行:
```
chimecli compute detachNicFromVm \
  --VmUuid 7a46560b-c00b-4acc-a677-4dcfbfa11a77 \
  --detachNicRequest.NicUuid 16655315-8684-4e22-bd5f-4d8d30618629
```

返回:

```
{
  "requestId": "c6eac3d4-67e8-4e39-a585-3d64a352c2ac",
  "result": {
    "vm": "ok"
  }
}
```