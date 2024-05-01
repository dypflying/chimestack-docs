---
title: API Usage Specification
weight: 1
---

ChimeStack provides standard Restful APIs, which is the fundamental service for the Web UI and the command line tool(CLI)

## HTTP Methods

ChimeStack API manipulates resource through HTTP Restful methods as following:  

| Method | Description  |
|-------|------|
| GET |  query information |
| POST | create resource | 
| PATCH | update resource |
| PUT  | update/hanlee resource |
| DELETE | delete resource | 

## Parameter Passing Methods

ChimeStack API's parameter passing methods include:
- in path: parameters passed in the url of HTTP
- in query: parameters passed in the HTTP query strings
- in body: parameters passed in the HTTP body

Usually an API request uses at least one parameter passing methods, maybe uses two or three combined methods in one request. For example, following is an API request for creating a cluster in an Availability Zone:

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

{AzUuid} is the "in path" parameter of AZ's uuid; the content of Body is the cluster's detail for the creating, it is "in body" parameter passing method

## Return Code And Return Content

### Return Code

Following is the return codes that ChimeStack's API may response:

| Return Code | Description |
|-------|------|
| 200 | response successfully |
| 400 | illegal or missing parameters | 
| 401 | no authorization |
| 403 | access denied |
| 404 | http resource not found | 
| 500 | service's internal error | 

### Return Content

ChimeStack API's response content in json format as following: 

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

for instance, the following is a successful response of creating a cluster:

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

## Authentification

ChimeStack wraps up an authorized token in the http headers for all the requests(except "login", "logout", "auth" requests) to authenticate, the format of the authentification header is:

```
Authorization: Bearer <api token>
```

For instance, following is a http request of creating a cluster invoked by the "curl" tool:

```
 curl -H "Content-Type: application/json" \
     -H "Authorization: Bearer 72d61210-2de0-4b76-a3ac-0c903c58cc2c" \
     -X POST 'http://mychimestack.com:8801/v1/az/cbd2819b-b49a-47ad-9fa4-307774d97865/cluster' \
     -d '{"name":"mycluster","description":"test cluster","hypervisor_type":"kvm", "arch":"x86_64"}' 
```

## Login and acquire an API token

API Token can be acquired by invoking the [Login API](/docs/reference/api/api/#login). For instance: 

```
 curl -H "Content-Type: application/json"  \
    -X POST  'http://mychimestack.com:8801/v1/login' \
    -d '{"user_name":"admin","password":"admin"}'   
```

If above command completes successfully, its output looks like: 

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

The "uuid" value in above response is the API token

## Logout and destroy the API token

To destroy an API token, you can invoke the "logout" command, for instance:

```
 curl -H "Content-Type: application/json" \
 -X POST  'http://mychimestack:8801/v1/logout' \
 -d '{"token":"d820ef87-8fab-434a-9129-d9f1b53e5820"}' 
```

After the logout, the API token is no longer valid