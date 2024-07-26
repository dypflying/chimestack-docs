---
title: 使用规范
weight: 1
---

ChimeStack提供标准Restful APIs, 除了通过Web GUI方式使用ChimeStack，您也可以通过Restful API或者[CLI](../../../cli)的方式使用ChimeStack。

## HTTP方法

ChimeStack API 通过标准Restful HTTP方法操作资源: 

| 方法名 | 说明  |
|-------|------|
| GET |  查询资源信息 |
| POST | 新建资源 | 
| PATCH | 修改资源信息 |
| PUT  | 修改/操作资源 |
| DELETE | 删除资源 | 


## 传参方式

ChimeStack的API传参方法包括:
- in path: 在http url的路径中传递
- in query: 在http的query string中传递
- in body: 在http的请求体中传递

往往一个API请求最少包含一种传参数方式，也可能三种同时使用。例如，在一个可用区(AZ)中创建一个集群(Cluster)的API原型为:

```
POST /v1/az/{AzUuid}/cluster 
Content-Type: application/json
Accept: application/json
Authorization: Bearer <api token>
Host: api.yourchimestack.com:8801
Body: {
  "arch": <system architecture>,
  "description": <description for the cluster>,
  "hypervisor_type": <hypervisor type>,
  "name": <cluster's name>,
  "type": <cluster type>
}
```
其中url中的{AzUuid}是被添加Cluster的可用区的Uuid，为"in path"类型传参，Body的内容是要创建Cluster的具体信息，为"in body"类型传参。


## 返回码和返回内容

### 返回码

以下是ChimeStack涉及到的Http返回码及说明: 

| 返回码 | 说明  |
|-------|------|
| 200 | 请求成功 |
| 400 | 请求包含了非法参数或者缺少参数 | 
| 401 | 访问没有授权 |
| 403 | 拒绝访问 |
| 404 | Http资源不存在 | 
| 500 | 服务器内部错误 | 

### 返回内容

Http请求的，返回内容的原型如下(json格式):

```
{
  "error": {
    "code": <error code>,
    "message": <error message>,
    "status": <error status>
  },
  "requestId": <http's unique request id>,
  "result": <result content>
}
```

例如，成功创建一个cluster的返回内容如下: 

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
## API的认证方式

ChimeStack API的认证方式是通过在Http Headers中传入ApiKey(api token)进行认证(登录API不需要认证)，传入Header的原型为：

```
Authorization: Bearer <api token>
```

例如,通过curl命令创建一个集群(cluster): 

```
 curl -H "Content-Type: application/json" \
     -H "Authorization: Bearer 72d61210-2de0-4b76-a3ac-0c903c58cc2c" \
     -X POST 'http://mychimestack.com:8801/v1/az/cbd2819b-b49a-47ad-9fa4-307774d97865/cluster' \
     -d '{"name":"mycluster","description":"test cluster","hypervisor_type":"kvm", "arch":"x86_64"}' 
```

## 登录并获取Token

Api Token需要用户通过调用[登录API](/docs/reference/api/api/#login)获取. 例如调用: 

```
 curl -H "Content-Type: application/json"  \
    -X POST  'http://mychimestack.com:8801/v1/login' \
    -d '{"user_name":"admin","password":"admin"}'   
```

登录成功后打印输出:

```
{
  "requestId": "8e6a050d-7476-4d80-a6bc-b2aada27dd76",
  "error": null,
  "result": {
    "user": {
      "uuid": "d820ef87-8fab-434a-9129-d9f1b53e5820", 
      "user_uuid": "9c15f4cb-5f6d-4e45-818f-a4315c54240c",
      "created_at": "2024-04-21T21:26:28.279496741+08:00",
      "expired_at": "2024-04-22T09:26:28.279496943+08:00"
    }
  }
}
```

输出信息中的"uuid"即为API Token

## 登出并销毁Token

如果不再需要使用API时，从安全角度考虑，需要销毁API Token，可以通过登出命令让token失效，例如调用:

```
 curl -H "Content-Type: application/json" \
 -X POST  'http://mychimestack:8801/v1/logout' \
 -d '{"token":"d820ef87-8fab-434a-9129-d9f1b53e5820"}' 
```
