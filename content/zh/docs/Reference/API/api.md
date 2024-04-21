---
title: ChimeStack API v0.0.1
language_tabs:
  - http: HTTP
toc_footers: []
includes: []
search: true
highlight_theme: darkula
headingLevel: 2

---

## Alert

### listAlert

<a id="opIdlistAlert"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/alert HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /alert`

list alerts

<h3 id="listalert-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|integer(int64)|false|filter by the 'state' field|
|severity|query|integer(int64)|false|filter by the 'severity' field|
|priority|query|integer(int64)|false|filter by the 'priority' field|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listalert-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getAlert

<a id="opIdgetAlert"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/alert/{AlertUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /alert/{AlertUuid}`

get an alert's detailed information

<h3 id="getalert-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AlertUuid|path|string|true|the alert's UUID|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getalert-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteAlert

<a id="opIddeleteAlert"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/alert/{AlertUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /alert/{AlertUuid}`

delete an alert

<h3 id="deletealert-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AlertUuid|path|string|true|the alert's UUID|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "9a59e8a7-4c9f-4a8b-9c4f-1676c057274a",
  "result": 0
}
```

<h3 id="deletealert-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### acceptAlert

<a id="opIdacceptAlert"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/alert/{AlertUuid}/accept HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PUT /alert/{AlertUuid}/accept`

accept an alert

> Body parameter

```json
{
  "comment": "string"
}
```

<h3 id="acceptalert-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AlertUuid|path|string|true|none|
|body|body|[AcceptAlertRequest](#schemaacceptalertrequest)|false|the http body of the post request|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "799f65c8-dd20-4b4c-94f9-0cdc92bd8119",
  "result": "ok"
}
```

<h3 id="acceptalert-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### listAlertRule

<a id="opIdlistAlertRule"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/alert_rule HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /alert_rule`

list alert rules

<h3 id="listalertrule-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|integer(int64)|false|filter by the 'state' field|
|severity|query|integer(int64)|false|filter by the 'severity' field|
|priority|query|integer(int64)|false|filter by the 'priority' field|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listalertrule-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getAlertRule

<a id="opIdgetAlertRule"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/alert_rule/{RuleUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /alert_rule/{RuleUuid}`

get an alert rule's detailed information

<h3 id="getalertrule-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|RuleUuid|path|string|true|the alert rule's UUID|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getalertrule-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getAlertStatistic

<a id="opIdgetAlertStatistic"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/alert_statistic HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /alert_statistic`

get alerts' statistical information

> Example responses


<h3 id="getalertstatistic-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## User

### auth

<a id="opIdauth"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/auth HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /auth`

user auth

> Body parameter

```json
{
  "token": "string"
}
```

<h3 id="auth-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[AuthRequest](#schemaauthrequest)|false|the http post body|

> Example responses


<h3 id="auth-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### login

<a id="opIdlogin"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/login HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /login`

user login

> Body parameter

```json
{
  "password": "string",
  "user_name": "string"
}
```

<h3 id="login-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[LoginRequest](#schemaloginrequest)|false|the http post body|

> Example responses


<h3 id="login-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### logout

<a id="opIdlogout"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/logout HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /logout`

user logout

> Body parameter

```json
{
  "token": "string"
}
```

<h3 id="logout-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[AuthRequest](#schemaauthrequest)|false|the http post body|

> Example responses


<h3 id="logout-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### listUser

<a id="opIdlistUser"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/user HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /user`

list users

<h3 id="listuser-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|role|query|integer(int64)|false|filter by the user's role(0:normal user, 1: readonly administrator, 2:administrator, 3: super administrator)|

> Example responses


<h3 id="listuser-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createUser

<a id="opIdcreateUser"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/user HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /user`

create an user

> Body parameter

```json
{
  "avatar": "string",
  "name": "string",
  "nick_name": "string",
  "password": "string",
  "role": 0
}
```

<h3 id="createuser-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CreateUserRequest](#schemacreateuserrequest)|false|the http post body|

> Example responses


<h3 id="createuser-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getUser

<a id="opIdgetUser"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/user/{UserUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /user/{UserUuid}`

describe an user

<h3 id="getuser-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|UserUuid|path|string|true|the user's uuid|

> Example responses


<h3 id="getuser-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteUser

<a id="opIddeleteUser"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/user/{UserUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /user/{UserUuid}`

delete an user

<h3 id="deleteuser-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|UserUuid|path|string|true|the user's uuid|

> Example responses


<h3 id="deleteuser-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateUser

<a id="opIdupdateUser"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/user/{UserUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /user/{UserUuid}`

update an user

> Body parameter

```json
{
  "avatar": "string",
  "name": "string",
  "nick_name": "string",
  "password": "string",
  "role": 0
}
```

<h3 id="updateuser-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|UserUuid|path|string|true|the user's uuid|
|body|body|[CreateUserRequest](#schemacreateuserrequest)|false|the http post body|

> Example responses


<h3 id="updateuser-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getUserDefault

<a id="opIdgetUserDefault"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/user/{UserUuid}/default HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /user/{UserUuid}/default`

describe a user default

<h3 id="getuserdefault-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|UserUuid|path|string|true|the user's uuid|

> Example responses


<h3 id="getuserdefault-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateUserDefault

<a id="opIdupdateUserDefault"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/user/{UserUuid}/default HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /user/{UserUuid}/default`

update user default

> Body parameter

```json
{
  "az_uuid": "string",
  "clusters_uuid": "string"
}
```

<h3 id="updateuserdefault-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|UserUuid|path|string|true|the user's uuid|
|body|body|[CreateUserDefaultRequest](#schemacreateuserdefaultrequest)|true|the http post body|

> Example responses


<h3 id="updateuserdefault-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## Az

### listAz

<a id="opIdlistAz"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az`

*Lists available zones*

This will show all available azs by default.

<h3 id="listaz-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|integer(int64)|false|filter by the 'state' field|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "c569a02d-066e-4265-a7fe-bcd698322a11",
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
        "description": "backup zone",
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

<h3 id="listaz-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createAz

<a id="opIdcreateAz"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/az HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /az`

*create available zone*

This will create an available az.

> Body parameter

```json
{
  "description": "string",
  "name": "string",
  "parent": "string"
}
```

<h3 id="createaz-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CreateAzRequest](#schemacreateazrequest)|false|the http post body|

> Example responses

> OpenApiResponse

```json
{
  "requestId": "ae40a6b7-b806-4590-8da2-2b4b3cc78896",
  "result": {
    "az": {
      "uuid": "f85ea8ba-912a-4639-801a-c464bc831e9c",
      "name": "TestZone5",
      "description": "test zone",
      "state": 1,
      "created_at": "2024-04-16T04:11:05.130019238Z"
    }
  }
}
```

<h3 id="createaz-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getAz

<a id="opIdgetAz"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}`

*describe an available zone*

This will describe an available az.

<h3 id="getaz-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "e2c8d21e-835a-4673-aa38-fa1e58018319",
  "result": {
    "az": {
      "created_at": "2023-06-29T03:46:02Z",
      "description": "default zone",
      "name": "Default",
      "state": 1,
      "uuid": "cbd2819b-b49a-47ad-9fa4-307774d97865"
    }
  }
}
```

<h3 id="getaz-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteAz

<a id="opIddeleteAz"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/az/{AzUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /az/{AzUuid}`

*delete an available zone*

This will delete an available az.

<h3 id="deleteaz-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "011f145a-ca14-41cb-b0c5-e665efd29f53",
  "result": 1
}
```

<h3 id="deleteaz-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateAz

<a id="opIdupdateAz"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/az/{AzUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /az/{AzUuid}`

*update an available zone*

This will update an available az.

> Body parameter

```json
{
  "description": "string",
  "name": "string",
  "parent": "string"
}
```

<h3 id="updateaz-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|body|body|[CreateAzRequest](#schemacreateazrequest)|true|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "196aa7d1-7271-448d-85d8-8dc7ac56c4d1",
  "result": {
    "az": "ok"
  }
}
```

<h3 id="updateaz-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### disableAz

<a id="opIddisableAz"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/az/{AzUuid}/disable HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`PUT /az/{AzUuid}/disable`

*disable an available zone*

This will disable an available az.

<h3 id="disableaz-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "b5b05590-8627-4035-b62a-33e685f1a302",
  "result": {
    "az": "ok"
  }
}
```

<h3 id="disableaz-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### enableAz

<a id="opIdenableAz"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/az/{AzUuid}/enable HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`PUT /az/{AzUuid}/enable`

*enable an available zone*

This will enable an available az.

<h3 id="enableaz-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "a56faede-7169-46db-ae4e-1c43ffe3f55d",
  "result": {
    "az": "ok"
  }
}
```

<h3 id="enableaz-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## Cluster

### listCluster

<a id="opIdlistCluster"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster`

*Lists clusters*

This will show clusters

<h3 id="listcluster-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|integer(int64)|false|filter by the 'state' field|
|type|query|integer(int64)|false|filter by the cluster's type (0: hyperconveged, 1:computing only, 2: storage only)|
|hypervisor_type|query|string|false|filter by the cluster's hypervisor type|
|arch|query|string|false|filter by the cluster's architecture|
|AzUuid|path|string|true|filter by the AZ's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listcluster-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createCluster

<a id="opIdcreateCluster"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /az/{AzUuid}/cluster`

*create a cluster in a specified Az*

This will create a cluster in a specified Az

> Body parameter

```json
{
  "arch": "string",
  "description": "string",
  "hypervisor_type": "string",
  "name": "string",
  "type": 0
}
```

<h3 id="createcluster-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|body|body|[CreateClusterRequest](#schemacreateclusterrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "8e3592e3-6581-4923-8292-e57418d128ad",
  "result": {
    "cluster": {
      "arch": "x86",
      "az_name": "",
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

<h3 id="createcluster-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getCluster

<a id="opIdgetCluster"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}`

*describe a cluster*

This will describe a cluster

<h3 id="getcluster-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getcluster-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteCluster

<a id="opIddeleteCluster"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /az/{AzUuid}/cluster/{ClusterUuid}`

*delete a cluster*

This will delete a cluster

<h3 id="deletecluster-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "39aa34ae-2a76-4409-b96a-212802364638",
  "result": 1
}
```

<h3 id="deletecluster-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateCluster

<a id="opIdupdateCluster"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /az/{AzUuid}/cluster/{ClusterUuid}`

*update a cluster.*

This will update a cluster.

> Body parameter

```json
{
  "arch": "string",
  "description": "string",
  "hypervisor_type": "string",
  "name": "string",
  "type": 0
}
```

<h3 id="updatecluster-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|body|body|[CreateClusterRequest](#schemacreateclusterrequest)|true|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "3bcdefae-d54a-4681-9004-fd163b997c90",
  "result": {
    "cluster": "ok"
  }
}
```

<h3 id="updatecluster-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### disableCluster

<a id="opIddisableCluster"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/disable HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`PUT /az/{AzUuid}/cluster/{ClusterUuid}/disable`

*disable a cluster*

This will disable a cluster

<h3 id="disablecluster-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "0abc7fc0-eff4-45ec-870e-cb65a6abf2d7",
  "result": {
    "cluster": "ok"
  }
}
```

<h3 id="disablecluster-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### enableCluster

<a id="opIdenableCluster"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/enable HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`PUT /az/{AzUuid}/cluster/{ClusterUuid}/enable`

*enable a cluster*

This will enable a cluster

<h3 id="enablecluster-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "43684ea3-d36b-479d-9793-4fa98fb8b214",
  "result": {
    "cluster": "ok"
  }
}
```

<h3 id="enablecluster-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## Host

### listHost

<a id="opIdlistHost"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/host HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}/host`

*Lists hosts*

This will show hosts

<h3 id="listhost-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|integer(int64)|false|filter by the 'state' field|
|rack_name|query|string|false|filter by the rack's name|
|manage_ip|query|string|false|filter by the host's management IP address|
|AzUuid|path|string|true|filter by the AZ's uuid|
|ClusterUuid|path|string|true|filter by the cluster's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listhost-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createHost

<a id="opIdcreateHost"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/host HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /az/{AzUuid}/cluster/{ClusterUuid}/host`

*create a host*

This will create a host

> Body parameter

```json
{
  "cpu_ratio": 0.1,
  "description": "string",
  "memory_ratio": 0.1,
  "reserved_memory": 0,
  "reserved_vcpus": 0,
  "uuid": "string"
}
```

<h3 id="createhost-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|body|body|[CreateHostRequest](#schemacreatehostrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createhost-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getHost

<a id="opIdgetHost"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/host/{HostUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}/host/{HostUuid}`

*describe a host*

This will describe a host

<h3 id="gethost-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|HostUuid|path|string|true|the host's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="gethost-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteHost

<a id="opIddeleteHost"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/host/{HostUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /az/{AzUuid}/cluster/{ClusterUuid}/host/{HostUuid}`

*delete a host*

This will delete a host

<h3 id="deletehost-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|HostUuid|path|string|true|the host's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "b363317b-6299-426c-8412-178aeaf42326",
  "result": 1
}
```

<h3 id="deletehost-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateHost

<a id="opIdupdateHost"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/host/{HostUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /az/{AzUuid}/cluster/{ClusterUuid}/host/{HostUuid}`

*update a host.*

This will update a host.

> Body parameter

```json
{
  "cpu_ratio": 0.1,
  "description": "string",
  "memory_ratio": 0.1,
  "reserved_memory": 0,
  "reserved_vcpus": 0
}
```

<h3 id="updatehost-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|HostUuid|path|string|true|the host's uuid|
|body|body|[UpdateHostRequest](#schemaupdatehostrequest)|true|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "c6ad8b13-9e99-4441-b3a0-ac6a1b611306",
  "result": {
    "host": "ok"
  }
}
```

<h3 id="updatehost-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### disableHost

<a id="opIddisableHost"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/host/{HostUuid}/disable HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`PUT /az/{AzUuid}/cluster/{ClusterUuid}/host/{HostUuid}/disable`

*disable a host*

This will disable a host

<h3 id="disablehost-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|HostUuid|path|string|true|the host's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "63514320-0abc-41ac-97ee-6b5df5fc7424",
  "result": {
    "host": "ok"
  }
}
```

<h3 id="disablehost-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### enableHost

<a id="opIdenableHost"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/host/{HostUuid}/enable HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`PUT /az/{AzUuid}/cluster/{ClusterUuid}/host/{HostUuid}/enable`

*enable a host*

This will enable a host

<h3 id="enablehost-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|HostUuid|path|string|true|the host's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "217560f4-41af-4c61-b61f-4998cbc2f07f",
  "result": {
    "host": "ok"
  }
}
```

<h3 id="enablehost-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### suspendHost

<a id="opIdsuspendHost"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/host/{HostUuid}/suspend HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`PUT /az/{AzUuid}/cluster/{ClusterUuid}/host/{HostUuid}/suspend`

*suspend a host*

This will suspend a host

<h3 id="suspendhost-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|HostUuid|path|string|true|the host's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "cc9484e2-7e7c-4aaa-82f1-8492f05a34ec",
  "result": {
    "host": "ok"
  }
}
```

<h3 id="suspendhost-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### listClient

<a id="opIdlistClient"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/client HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /client`

*Lists available client*

This will show available clients

<h3 id="listclient-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|integer(int64)|false|filter by the 'state' field|
|rack_name|query|string|false|filter by the rack's name|
|manage_ip|query|string|false|filter by the client's management IP address|
|all|query|integer(int64)|false|retrieve all the clients|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listclient-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getHostStatistic

<a id="opIdgetHostStatistic"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/host_statistic HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /host_statistic`

describe host inventory statistic

<h3 id="gethoststatistic-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|cluster_uuid|query|string|false|the cluster's uuid|
|host_uuid|query|string|false|the host's uuid|

#### Detailed descriptions

**cluster_uuid**: the cluster's uuid
in:qeury

**host_uuid**: the host's uuid
in:qeury

> Example responses


<h3 id="gethoststatistic-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## InstanceSpec

### listClusterInstanceSpecRelation

<a id="opIdlistClusterInstanceSpecRelation"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/instance_spec_relation HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}/instance_spec_relation`

list instance spec relations

<h3 id="listclusterinstancespecrelation-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listclusterinstancespecrelation-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createClusterInstanceSpecRelation

<a id="opIdcreateClusterInstanceSpecRelation"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/instance_spec_relation HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /az/{AzUuid}/cluster/{ClusterUuid}/instance_spec_relation`

create new instance spec relation

> Body parameter

```json
{
  "instance_spec_uuid": "string"
}
```

<h3 id="createclusterinstancespecrelation-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|body|body|[CreateClusterInstanceSpecRequest](#schemacreateclusterinstancespecrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createclusterinstancespecrelation-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteClusterInstanceSpecRelation

<a id="opIddeleteClusterInstanceSpecRelation"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/instance_spec_relation/{InstanceSpecUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /az/{AzUuid}/cluster/{ClusterUuid}/instance_spec_relation/{InstanceSpecUuid}`

delete an instance spec relation

<h3 id="deleteclusterinstancespecrelation-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|InstanceSpecUuid|path|string|true|the instance specification's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "ebf4f99d-37fb-45f2-935e-ba99052a3af7",
  "result": 1
}
```

<h3 id="deleteclusterinstancespecrelation-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### listInstanceSpec

<a id="opIdlistInstanceSpec"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/instance_spec HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /instance_spec`

list instance specs

<h3 id="listinstancespec-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|type|query|integer(int64)|false|filter by the instance specification's type(0: shared, 1: dedicated)|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listinstancespec-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createInstanceSpec

<a id="opIdcreateInstanceSpec"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/instance_spec HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /instance_spec`

create an instance spec

> Body parameter

```json
{
  "description": "string",
  "memory": 0,
  "name": "string",
  "type": 0,
  "vcpus": 0
}
```

<h3 id="createinstancespec-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CreateInstanceSpecRequest](#schemacreateinstancespecrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createinstancespec-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getInstanceSpec

<a id="opIdgetInstanceSpec"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/instance_spec/{InstanceSpecUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /instance_spec/{InstanceSpecUuid}`

describe an instance spec

<h3 id="getinstancespec-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|InstanceSpecUuid|path|string|true|the instance specification's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getinstancespec-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteInstanceSpec

<a id="opIddeleteInstanceSpec"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/instance_spec/{InstanceSpecUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /instance_spec/{InstanceSpecUuid}`

delete an instance spec

<h3 id="deleteinstancespec-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|InstanceSpecUuid|path|string|true|the instance specification's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "1b24222f-0158-4d10-84c8-c478157e2465",
  "result": 1
}
```

<h3 id="deleteinstancespec-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateInstanceSpec

<a id="opIdupdateInstanceSpec"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/instance_spec/{InstanceSpecUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /instance_spec/{InstanceSpecUuid}`

update instance spec

> Body parameter

```json
{
  "description": "string",
  "memory": 0,
  "name": "string",
  "type": 0,
  "vcpus": 0
}
```

<h3 id="updateinstancespec-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|InstanceSpecUuid|path|string|true|the instance specification's uuid|
|body|body|[CreateInstanceSpecRequest](#schemacreateinstancespecrequest)|true|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "7c5d3460-83b5-48e8-84bd-a3a8b912c908",
  "result": {
    "instance_spec": "ok"
  }
}
```

<h3 id="updateinstancespec-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## Network

### listNetwork

<a id="opIdlistNetwork"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/network HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}/network`

list networks

<h3 id="listnetwork-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|integer(int64)|false|filter by the 'state' field|
|type|query|integer(int64)|false|filter by network type(0: classical network, 1:vlan, 2:vxlan)|
|interface_name|query|string|false|filter by network interface's name|
|AzUuid|path|string|true|filter by AZ's uuid|
|ClusterUuid|path|string|true|filter by the cluster's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listnetwork-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createNetwork

<a id="opIdcreateNetwork"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/network HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /az/{AzUuid}/cluster/{ClusterUuid}/network`

create a network

> Body parameter

```json
{
  "description": "string",
  "interface_name": "string",
  "name": "string",
  "type": 0
}
```

<h3 id="createnetwork-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|body|body|[CreateNetworkRequest](#schemacreatenetworkrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createnetwork-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getNetwork

<a id="opIdgetNetwork"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}`

describe a network

<h3 id="getnetwork-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|NetworkUuid|path|string|true|the network's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getnetwork-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteNetwork

<a id="opIddeleteNetwork"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}`

delete a network

<h3 id="deletenetwork-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|NetworkUuid|path|string|true|the network's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "2594ebfe-cc1c-44a2-965c-cad7bc9fbd55",
  "result": 1
}
```

<h3 id="deletenetwork-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateNetwork

<a id="opIdupdateNetwork"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}`

update a network

> Body parameter

```json
{
  "description": "string",
  "name": "string"
}
```

<h3 id="updatenetwork-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|NetworkUuid|path|string|true|the network's uuid|
|body|body|[UpdateNetworkRequest](#schemaupdatenetworkrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "484f5728-ee8f-44a1-a1df-4b156b9d58a5",
  "result": {
    "network": "ok"
  }
}
```

<h3 id="updatenetwork-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### listSubnet

<a id="opIdlistSubnet"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}/subnet HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}/subnet`

list subnets

<h3 id="listsubnet-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|integer(int64)|false|filter by the 'state' field|
|type|query|integer(int64)|false|filter by subnet's type|
|AzUuid|path|string|true|filter by AZ's uuid|
|ClusterUuid|path|string|true|filter by cluster's uuid|
|NetworkUuid|path|string|true|filter by network's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listsubnet-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createSubnet

<a id="opIdcreateSubnet"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}/subnet HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}/subnet`

create a subnet

> Body parameter

```json
{
  "cidr": "string",
  "description": "string",
  "gateway": "string",
  "name": "string",
  "reserved_ips": "string"
}
```

<h3 id="createsubnet-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|NetworkUuid|path|string|true|the network's uuid|
|body|body|[CreateSubnetRequest](#schemacreatesubnetrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createsubnet-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getSubnet

<a id="opIdgetSubnet"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}/subnet/{SubnetUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}/subnet/{SubnetUuid}`

describe a subnet

<h3 id="getsubnet-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|NetworkUuid|path|string|true|the network's uuid|
|SubnetUuid|path|string|true|the subnet's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getsubnet-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteSubnet

<a id="opIddeleteSubnet"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}/subnet/{SubnetUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}/subnet/{SubnetUuid}`

delete a subnet

<h3 id="deletesubnet-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|NetworkUuid|path|string|true|the network's uuid|
|SubnetUuid|path|string|true|the subnet's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "e5a8a943-cabc-4959-ad6d-eac97f384839",
  "result": 1
}
```

<h3 id="deletesubnet-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateSubnet

<a id="opIdupdateSubnet"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}/subnet/{SubnetUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /az/{AzUuid}/cluster/{ClusterUuid}/network/{NetworkUuid}/subnet/{SubnetUuid}`

update a subnet

> Body parameter

```json
{
  "cidr": "string",
  "description": "string",
  "gateway": "string",
  "name": "string",
  "reserved_ips": "string"
}
```

<h3 id="updatesubnet-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|NetworkUuid|path|string|true|the network's uuid|
|SubnetUuid|path|string|true|the subnet's uuid|
|body|body|[CreateSubnetRequest](#schemacreatesubnetrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "4e5ff592-6c71-426f-a9ed-6691972d7443",
  "result": {
    "subnet": "ok"
  }
}
```

<h3 id="updatesubnet-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### listNic

<a id="opIdlistNic"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/nic HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /nic`

list nics

<h3 id="listnic-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|string|false|filter by the 'state' field|
|uuid|query|string|false|filter by the network interface's uuid|
|subnet_uuid|query|string|false|filter by the subnet's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listnic-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createNic

<a id="opIdcreateNic"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/nic HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /nic`

create a nic

> Body parameter

```json
{
  "description": "string",
  "ip": "string",
  "name": "string",
  "primary": 0,
  "subnet_uuid": "string"
}
```

<h3 id="createnic-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CreateNicRequest](#schemacreatenicrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createnic-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getNic

<a id="opIdgetNic"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/nic/{NicUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /nic/{NicUuid}`

describe nic

<h3 id="getnic-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|NicUuid|path|string|true|the network interface's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getnic-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteNic

<a id="opIddeleteNic"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/nic/{NicUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /nic/{NicUuid}`

delete a nic

<h3 id="deletenic-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|NicUuid|path|string|true|the network interface's uuid|
|force_del|query|string|false|whether to force delete the network interface from the OS|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "3269c569-e2f1-408c-b0e5-06ba7eeadf0f",
  "result": 1
}
```

<h3 id="deletenic-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateNic

<a id="opIdupdateNic"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/nic/{NicUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /nic/{NicUuid}`

update a nic

> Body parameter

```json
{
  "description": "string",
  "name": "string"
}
```

<h3 id="updatenic-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|NicUuid|path|string|true|the network interface's uuid|
|body|body|[UpdateNicRequest](#schemaupdatenicrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "edce4af3-c02f-4e73-823f-cca75b9870a5",
  "result": {
    "vm": "ok"
  }
}
```

<h3 id="updatenic-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getNicStatistic

<a id="opIdgetNicStatistic"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/nic_statistic HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /nic_statistic`

describe nic statistic

> Example responses


<h3 id="getnicstatistic-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## StoragePool

### listStoragePool

<a id="opIdlistStoragePool"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/storage_pool HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}/storage_pool`

list storage pools

<h3 id="liststoragepool-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|integer(int64)|false|filter by the 'state' field|
|type|query|integer(int64)|false|filter the storage pool's type (0: local, 1: iscsi, 2: ceph)|
|AzUuid|path|string|true|filter by the AZ's uuid|
|ClusterUuid|path|string|true|filter by the cluster's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="liststoragepool-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createStoragePool

<a id="opIdcreateStoragePool"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/storage_pool HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /az/{AzUuid}/cluster/{ClusterUuid}/storage_pool`

create a storage pool

> Body parameter

```json
{
  "backend_path": "string",
  "description": "string",
  "image_cache_path": "string",
  "name": "string",
  "physical_size": 0,
  "reserved_size": 0,
  "size_ratio": 0.1,
  "type": 0
}
```

<h3 id="createstoragepool-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|body|body|[CreateStoragePoolRequest](#schemacreatestoragepoolrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createstoragepool-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getStoragePool

<a id="opIdgetStoragePool"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/storage_pool/{StoragePoolUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}/storage_pool/{StoragePoolUuid}`

describe a storage pool

<h3 id="getstoragepool-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|StoragePoolUuid|path|string|true|the storage pool's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getstoragepool-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteStoragePool

<a id="opIddeleteStoragePool"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/storage_pool/{StoragePoolUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /az/{AzUuid}/cluster/{ClusterUuid}/storage_pool/{StoragePoolUuid}`

delete a storage pool

<h3 id="deletestoragepool-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|StoragePoolUuid|path|string|true|the storage pool's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "a76eed93-e64f-4ce7-8bad-acd2e1fd52fa",
  "result": 1
}
```

<h3 id="deletestoragepool-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateStoragePool

<a id="opIdupdateStoragePool"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/storage_pool/{StoragePoolUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /az/{AzUuid}/cluster/{ClusterUuid}/storage_pool/{StoragePoolUuid}`

update a storage pool

> Body parameter

```json
{
  "backend_path": "string",
  "description": "string",
  "image_cache_path": "string",
  "name": "string",
  "physical_size": 0,
  "reserved_size": 0,
  "size_ratio": 0.1,
  "type": 0
}
```

<h3 id="updatestoragepool-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|StoragePoolUuid|path|string|true|the storage pool's uuid|
|body|body|[CreateStoragePoolRequest](#schemacreatestoragepoolrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "d42d4a0b-f3e9-450e-a95e-d9d7cffd9a91",
  "result": {
    "storage_pool": "ok"
  }
}
```

<h3 id="updatestoragepool-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### listStoragePoolAll

<a id="opIdlistStoragePoolAll"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/storage_pool HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /storage_pool`

list all storage pools

<h3 id="liststoragepoolall-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|integer(int64)|false|filter by the 'state' field|

> Example responses


<h3 id="liststoragepoolall-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getStoragePoolStatistic

<a id="opIdgetStoragePoolStatistic"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/storage_pool_statistic HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /storage_pool_statistic`

describe storage pool inventory statistic

<h3 id="getstoragepoolstatistic-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|cluster_uuid|query|string|false|the cluster's uuid|
|storage_pool_uuid|query|string|false|the storage pool's uuid|

#### Detailed descriptions

**cluster_uuid**: the cluster's uuid
in:qeury

**storage_pool_uuid**: the storage pool's uuid
in:qeury

> Example responses


<h3 id="getstoragepoolstatistic-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## Volume

### listVolume

<a id="opIdlistVolume"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/volume HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}/volume`

list volumes

<h3 id="listvolume-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|string|false|filter by the 'state' field|
|uuid|query|string|false|filter by volume's uuid|
|host_uuid|query|string|false|filter by host's uuid|
|AzUuid|path|string|true|filter by AZ's uuid|
|ClusterUuid|path|string|true|filter by cluster's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listvolume-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createVolume

<a id="opIdcreateVolume"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/volume HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /az/{AzUuid}/cluster/{ClusterUuid}/volume`

create new volume

> Body parameter

```json
{
  "description": "string",
  "host_uuid": "string",
  "image_uuid": "string",
  "name": "string",
  "root": 0,
  "size": 0,
  "volume_spec_uuid": "string"
}
```

<h3 id="createvolume-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|body|body|[CreateVolumeRequest](#schemacreatevolumerequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createvolume-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getVolume

<a id="opIdgetVolume"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/volume/{VolumeUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}/volume/{VolumeUuid}`

describe a volume

<h3 id="getvolume-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VolumeUuid|path|string|true|the volume's uuid|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getvolume-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteVolume

<a id="opIddeleteVolume"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/volume/{VolumeUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /az/{AzUuid}/cluster/{ClusterUuid}/volume/{VolumeUuid}`

delete a volume

<h3 id="deletevolume-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VolumeUuid|path|string|true|the volume's uuid|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|force_del|query|string|false|whether to delete the physical volume in the node|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "bb931734-6051-486b-b0fb-b33f63de2d29",
  "result": 1
}
```

<h3 id="deletevolume-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateVolume

<a id="opIdupdateVolume"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/volume/{VolumeUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /az/{AzUuid}/cluster/{ClusterUuid}/volume/{VolumeUuid}`

update a volume

> Body parameter

```json
{
  "description": "string",
  "name": "string"
}
```

<h3 id="updatevolume-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VolumeUuid|path|string|true|the volume's uuid|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|body|body|[UpdateVolumeRequest](#schemaupdatevolumerequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "ded9e524-20d4-4a45-843b-d6cd13b76ec0",
  "result": {
    "vm": "ok"
  }
}
```

<h3 id="updatevolume-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### listSnapshot

<a id="opIdlistSnapshot"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/snapshot HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /snapshot`

list all snapshots

<h3 id="listsnapshot-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|string|false|filter by the 'state' field|

> Example responses


<h3 id="listsnapshot-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### listVolumeSnapshot

<a id="opIdlistVolumeSnapshot"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/volume/{VolumeUuid}/snapshot HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /volume/{VolumeUuid}/snapshot`

list snapshots of a volume

<h3 id="listvolumesnapshot-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|integer(int64)|false|filter by the 'state' field|
|VolumeUuid|path|string|true|filter by tge volume's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listvolumesnapshot-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createSnapshot

<a id="opIdcreateSnapshot"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/volume/{VolumeUuid}/snapshot HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /volume/{VolumeUuid}/snapshot`

create a snapshot

> Body parameter

```json
{
  "description": "string",
  "name": "string"
}
```

<h3 id="createsnapshot-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VolumeUuid|path|string|true|the volume's uuid|
|body|body|[CreateSnapshotRequest](#schemacreatesnapshotrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createsnapshot-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getSnapshot

<a id="opIdgetSnapshot"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/volume/{VolumeUuid}/snapshot/{SnapshotUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /volume/{VolumeUuid}/snapshot/{SnapshotUuid}`

get a snapshot

<h3 id="getsnapshot-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VolumeUuid|path|string|true|the volume's uuid|
|SnapshotUuid|path|string|true|the snapshot's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getsnapshot-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteSnapshot

<a id="opIddeleteSnapshot"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/volume/{VolumeUuid}/snapshot/{SnapshotUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /volume/{VolumeUuid}/snapshot/{SnapshotUuid}`

delete a snapshot

<h3 id="deletesnapshot-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VolumeUuid|path|string|true|the volume's uuid|
|SnapshotUuid|path|string|true|the snapshot's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "3198bfaf-dfb6-478a-8ef7-abf7396372df",
  "result": "ok"
}
```

<h3 id="deletesnapshot-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateSnapshot

<a id="opIdupdateSnapshot"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/volume/{VolumeUuid}/snapshot/{SnapshotUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /volume/{VolumeUuid}/snapshot/{SnapshotUuid}`

update a snapshot

> Body parameter

```json
{
  "description": "string",
  "name": "string"
}
```

<h3 id="updatesnapshot-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VolumeUuid|path|string|true|the volume's uuid|
|SnapshotUuid|path|string|true|the snapshot's uuid|
|body|body|[CreateSnapshotRequest](#schemacreatesnapshotrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "78527034-0b25-416c-b510-2bef0c68d4e2",
  "result": {
    "snapshot": "ok"
  }
}
```

<h3 id="updatesnapshot-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### restoreVolume

<a id="opIdrestoreVolume"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/volume/{VolumeUuid}/snapshot/{SnapshotUuid}/restore HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`PUT /volume/{VolumeUuid}/snapshot/{SnapshotUuid}/restore`

restore volume from a snapshot

<h3 id="restorevolume-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VolumeUuid|path|string|true|the volume's uuid|
|SnapshotUuid|path|string|true|the snapshot's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="restorevolume-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getVolumeStatistic

<a id="opIdgetVolumeStatistic"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/volume_statistic HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /volume_statistic`

describe volume statistic

> Example responses


<h3 id="getvolumestatistic-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## VolumeSpec

### listClusterVolumeSpecRelation

<a id="opIdlistClusterVolumeSpecRelation"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/volume_spec_relation HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /az/{AzUuid}/cluster/{ClusterUuid}/volume_spec_relation`

list volume spec relations

<h3 id="listclustervolumespecrelation-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listclustervolumespecrelation-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createClusterVolumeSpecRelation

<a id="opIdcreateClusterVolumeSpecRelation"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/volume_spec_relation HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /az/{AzUuid}/cluster/{ClusterUuid}/volume_spec_relation`

create new volume spec relation

> Body parameter

```json
{
  "volume_spec_uuid": "string"
}
```

<h3 id="createclustervolumespecrelation-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|body|body|[CreateClusterVolumeSpecRequest](#schemacreateclustervolumespecrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createclustervolumespecrelation-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteClusterVolumeSpecRelation

<a id="opIddeleteClusterVolumeSpecRelation"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/az/{AzUuid}/cluster/{ClusterUuid}/volume_spec_relation/{VolumeSpecUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /az/{AzUuid}/cluster/{ClusterUuid}/volume_spec_relation/{VolumeSpecUuid}`

delete an volume spec relation

<h3 id="deleteclustervolumespecrelation-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AzUuid|path|string|true|the AZ's uuid|
|ClusterUuid|path|string|true|the cluster's uuid|
|VolumeSpecUuid|path|string|true|the volume specification's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "85e088bc-9b81-4172-b3ee-0f61da006106",
  "result": 1
}
```

<h3 id="deleteclustervolumespecrelation-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### listVolumeSpec

<a id="opIdlistVolumeSpec"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/volume_spec HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /volume_spec`

list volume specs

<h3 id="listvolumespec-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|storage_pool_uuid|query|string|false|filter by the storage pool's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listvolumespec-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createVolumeSpec

<a id="opIdcreateVolumeSpec"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/volume_spec HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /volume_spec`

create a volume spec

> Body parameter

```json
{
  "description": "string",
  "max_iops": 0,
  "max_throughput": 0,
  "min_iops": 0,
  "min_throughput": 0,
  "name": "string",
  "step_iops": 0,
  "step_throughput": 0,
  "storage_pool_uuid": "string"
}
```

<h3 id="createvolumespec-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CreateVolumeSpecRequest](#schemacreatevolumespecrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createvolumespec-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getVolumeSpec

<a id="opIdgetVolumeSpec"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/volume_spec/{VolumeSpecUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /volume_spec/{VolumeSpecUuid}`

describe a volume spec

<h3 id="getvolumespec-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VolumeSpecUuid|path|string|true|the volume specification's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getvolumespec-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteVolumeSpec

<a id="opIddeleteVolumeSpec"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/volume_spec/{VolumeSpecUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /volume_spec/{VolumeSpecUuid}`

delete a volume spec

<h3 id="deletevolumespec-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VolumeSpecUuid|path|string|true|the volume specification's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "7f7800e9-0057-44a5-9340-c46fda540dbe",
  "result": 1
}
```

<h3 id="deletevolumespec-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateVolumeSpec

<a id="opIdupdateVolumeSpec"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/volume_spec/{VolumeSpecUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /volume_spec/{VolumeSpecUuid}`

update volume spec

> Body parameter

```json
{
  "description": "string",
  "max_iops": 0,
  "max_throughput": 0,
  "min_iops": 0,
  "min_throughput": 0,
  "name": "string",
  "step_iops": 0,
  "step_throughput": 0,
  "storage_pool_uuid": "string"
}
```

<h3 id="updatevolumespec-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VolumeSpecUuid|path|string|true|the volume specification's uuid|
|body|body|[CreateVolumeSpecRequest](#schemacreatevolumespecrequest)|true|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "6594c3cb-2a6a-4fcc-85d1-00746b29c980",
  "result": {
    "volume_spec": "ok"
  }
}
```

<h3 id="updatevolumespec-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## Config

### getConfig

<a id="opIdgetConfig"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/config?Token=string HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /config`

get server config

<h3 id="getconfig-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|Token|query|string|true|the api access token string|

> Example responses


<h3 id="getconfig-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## Image

### listImage

<a id="opIdlistImage"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/image HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /image`

list images

<h3 id="listimage-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|string|false|filter by the 'state' field|
|format|query|string|false|filter by the 'format' field|
|os_type|query|string|false|filter by the 'os_type' field|
|type|query|integer(int64)|false|filter by the 'type' field|
|uuid|query|string|false|filter by the 'uuid' field|
|bucket_uuid|query|string|false|filter by the 'bucket_uuid' field|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listimage-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createPublicImage

<a id="opIdcreatePublicImage"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/image/public HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /image/public`

create a public image

> Body parameter

```json
{
  "boot_type": "string",
  "description": "string",
  "format": "string",
  "install_url": "string",
  "name": "string",
  "os_arch": "string",
  "os_detail": "string",
  "os_type": "string",
  "shared": 0
}
```

<h3 id="createpublicimage-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CreateImageRequest](#schemacreateimagerequest)|false|the http body of the post request|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createpublicimage-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createUserImage

<a id="opIdcreateUserImage"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/image/user HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /image/user`

create a user's private image

> Body parameter

```json
{
  "boot_type": "string",
  "description": "string",
  "format": "string",
  "install_url": "string",
  "name": "string",
  "os_arch": "string",
  "os_detail": "string",
  "os_type": "string",
  "shared": 0
}
```

<h3 id="createuserimage-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CreateImageRequest](#schemacreateimagerequest)|false|the http body of the post request|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createuserimage-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getImage

<a id="opIdgetImage"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/image/{ImageUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /image/{ImageUuid}`

get an image's detailed information

<h3 id="getimage-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|ImageUuid|path|string|true|the image's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getimage-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteImage

<a id="opIddeleteImage"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/image/{ImageUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /image/{ImageUuid}`

delete an image

<h3 id="deleteimage-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|ImageUuid|path|string|true|the image's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "8c6fbd16-83a3-47f7-a10f-b0f5ab76f74c",
  "result": 0
}
```

<h3 id="deleteimage-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateImage

<a id="opIdupdateImage"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/image/{ImageUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /image/{ImageUuid}`

update an image's information

> Body parameter

```json
{
  "boot_type": "string",
  "description": "string",
  "format": "string",
  "name": "string",
  "os_arch": "string",
  "os_detail": "string",
  "os_type": "string",
  "shared": 0
}
```

<h3 id="updateimage-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|ImageUuid|path|string|true|none|
|body|body|[UpdateImageRequest](#schemaupdateimagerequest)|false|the http body of the post request|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "136bdfad-2ee1-49fd-a754-c2b5c33876a2",
  "result": {
    "image": "ok"
  }
}
```

<h3 id="updateimage-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getImageStatistic

<a id="opIdgetImageStatistic"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/image_statistic HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /image_statistic`

get s3-inventory's statistical information

> Example responses


<h3 id="getimagestatistic-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### listImageBucket

<a id="opIdlistImageBucket"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/imagebucket HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /imagebucket`

list image buckets

<h3 id="listimagebucket-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|integer(int64)|false|filter by the 'state' field|
|type|query|integer(int64)|false|filter by the 'type' field|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listimagebucket-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createImageBucket

<a id="opIdcreateImageBucket"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/imagebucket HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /imagebucket`

create an image bucket

> Body parameter

```json
{
  "bucket_name": "string",
  "description": "string",
  "name": "string",
  "type": 0
}
```

<h3 id="createimagebucket-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CreateImageBucketRequest](#schemacreateimagebucketrequest)|false|the http body of the post request|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "30d27042-5db8-45a6-9a9e-3122627e348f",
  "result": {
    "imagebucket": {
      "bucket_name": "test-bucket",
      "created_at": "2024-04-18T08:31:40.361909182Z",
      "description": "",
      "image_count": 0,
      "name": "test-bucket",
      "state": 1,
      "type": 0,
      "user_name": "",
      "uuid": "af706772-097c-49c7-979d-8a987e258306"
    }
  }
}
```

<h3 id="createimagebucket-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getImageBucket

<a id="opIdgetImageBucket"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/imagebucket/{ImageBucketUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /imagebucket/{ImageBucketUuid}`

get an image bucket's detailed information

<h3 id="getimagebucket-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|ImageBucketUuid|path|string|true|the image bucket's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="getimagebucket-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteImageBucket

<a id="opIddeleteImageBucket"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/imagebucket/{ImageBucketUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /imagebucket/{ImageBucketUuid}`

delete an image bucket

<h3 id="deleteimagebucket-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|ImageBucketUuid|path|string|true|the image bucket's uuid|

> Example responses


<h3 id="deleteimagebucket-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## Metrics

### getCpuStats

<a id="opIdgetCpuStats"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/metrics/cpu?range=0&window=0&vm_uuid=string HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/cpu`

get vm cpu statistics

<h3 id="getcpustats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|true|the time range for querying the statistics|
|window|query|integer(int64)|true|the time window for aggregating the statistics|
|vm_uuid|query|string|true|the virtual machine's uuid|

> Example responses


<h3 id="getcpustats-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getDiskIOStats

<a id="opIdgetDiskIOStats"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/metrics/disk_io?range=0&window=0&vm_uuid=string HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/disk_io`

get vm disk i/o statistics

<h3 id="getdiskiostats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|true|the time range for querying the statistics|
|window|query|integer(int64)|true|the time window for aggregating the statistics|
|vm_uuid|query|string|true|the virtual machine's uuid|

> Example responses


<h3 id="getdiskiostats-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getInterfaceNetIOStats

<a id="opIdgetInterfaceNetIOStats"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/metrics/interface_net_io?range=0&window=0&interface_uuid=string HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/interface_net_io`

get interface net i/o statistics

<h3 id="getinterfacenetiostats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|true|the time range for querying the statistics|
|window|query|integer(int64)|true|the time window for aggregating the statistics|
|interface_uuid|query|string|true|the network interface's uuid|

> Example responses


<h3 id="getinterfacenetiostats-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getMemoryStats

<a id="opIdgetMemoryStats"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/metrics/memory?range=0&window=0&vm_uuid=string HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/memory`

get vm memory statistics

<h3 id="getmemorystats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|true|the time range for querying the statistics|
|window|query|integer(int64)|true|the time window for aggregating the statistics|
|vm_uuid|query|string|true|the virtual machine's uuid|

> Example responses


<h3 id="getmemorystats-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getNetIOStats

<a id="opIdgetNetIOStats"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/metrics/net_io?range=0&window=0&vm_uuid=string HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/net_io`

get vm network i/o statistics

<h3 id="getnetiostats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|true|the time range for querying the statistics|
|window|query|integer(int64)|true|the time window for aggregating the statistics|
|vm_uuid|query|string|true|the virtual machine's uuid|

> Example responses


<h3 id="getnetiostats-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getTotalCpuStats

<a id="opIdgetTotalCpuStats"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/metrics/total_cpu?range=0&window=0 HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/total_cpu`

get total cpu statistics

<h3 id="gettotalcpustats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|true|the time range for querying the statistics|
|window|query|integer(int64)|true|the time window for aggregating the statistics|

> Example responses


<h3 id="gettotalcpustats-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getTotalDiskIOStats

<a id="opIdgetTotalDiskIOStats"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/metrics/total_disk_io?range=0&window=0 HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/total_disk_io`

get total disk i/o statistics

<h3 id="gettotaldiskiostats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|true|the time range for querying the statistics|
|window|query|integer(int64)|true|the time window for aggregating the statistics|

> Example responses


<h3 id="gettotaldiskiostats-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getTotalMemoryStats

<a id="opIdgetTotalMemoryStats"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/metrics/total_memory?range=0&window=0 HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/total_memory`

get total memory statistics

<h3 id="gettotalmemorystats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|true|the time range for querying the statistics|
|window|query|integer(int64)|true|the time window for aggregating the statistics|

> Example responses


<h3 id="gettotalmemorystats-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getTotalNetIOStats

<a id="opIdgetTotalNetIOStats"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/metrics/total_net_io?range=0&window=0 HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/total_net_io`

get total network i/o statistics

<h3 id="gettotalnetiostats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|true|the time range for querying the statistics|
|window|query|integer(int64)|true|the time window for aggregating the statistics|

> Example responses


<h3 id="gettotalnetiostats-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getUserCpuStats

<a id="opIdgetUserCpuStats"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/metrics/user_cpu?range=0&window=0 HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/user_cpu`

get user total cpu statistics

<h3 id="getusercpustats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|true|the time range for querying the statistics|
|window|query|integer(int64)|true|the time window for aggregating the statistics|

> Example responses


<h3 id="getusercpustats-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getUserMemoryStats

<a id="opIdgetUserMemoryStats"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/metrics/user_memory?range=0&window=0 HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/user_memory`

get user total memory statistics

<h3 id="getusermemorystats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|true|the time range for querying the statistics|
|window|query|integer(int64)|true|the time window for aggregating the statistics|

> Example responses


<h3 id="getusermemorystats-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getVolumeDiskIOStats

<a id="opIdgetVolumeDiskIOStats"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/metrics/volume_disk_io?range=0&window=0&volume_uuid=string HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/volume_disk_io`

get volume disk i/o statistics

<h3 id="getvolumediskiostats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|true|the time range for querying the statistics|
|window|query|integer(int64)|true|the time window for aggregating the statistics|
|volume_uuid|query|string|true|the volume's uuid|

> Example responses


<h3 id="getvolumediskiostats-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## Compute

### listVm

<a id="opIdlistVm"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/vm HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /vm`

list vms

<h3 id="listvm-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer(int64)|false|the page number of the results in paging|
|size|query|integer(int64)|false|the page size of the results in paging|
|sort|query|string|false|the field to be sorted by|
|order|query|string|false|'asc' or 'desc' of sorting|
|name|query|string|false|filter by the 'name' field|
|state|query|string|false|filter by the 'state' field|
|uuid|query|string|false|filter by the 'uuid' field|
|host_uuid|query|string|false|filter by the 'host_uuid' field|
|az_uuid|query|string|false|filter by the 'az_uuid' field|
|cluster_uuid|query|string|false|filter by the 'cluster_uuid' field|

> Example responses


> OpenApiResponse

```json
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

<h3 id="listvm-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### createVm

<a id="opIdcreateVm"></a>

> Code samples

```http
POST http://api.yourchimestack.com:8801/v1/vm HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`POST /vm`

create a vm

> Body parameter

```json
{
  "az_uuid": "string",
  "cdrom": {
    "bootable": 0,
    "host_uuid": "string",
    "image_uuid": "string",
    "name": "string",
    "volume_spec_uuid": "string"
  },
  "cluster_uuid": "string",
  "description": "string",
  "host_uuid": "string",
  "instance_spec_uuid": "string",
  "name": "string",
  "nics": [
    {
      "description": "string",
      "ip": "string",
      "name": "string",
      "primary": 0,
      "subnet_uuid": "string"
    }
  ],
  "password": "string",
  "vnc_password": "string",
  "volumes": [
    {
      "description": "string",
      "host_uuid": "string",
      "image_uuid": "string",
      "name": "string",
      "root": 0,
      "size": 0,
      "volume_spec_uuid": "string"
    }
  ]
}
```

<h3 id="createvm-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CreateVmRequest](#schemacreatevmrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
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

<h3 id="createvm-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### describeVm

<a id="opIddescribeVm"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/vm/{VmUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /vm/{VmUuid}`

describe a vm

<h3 id="describevm-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VmUuid|path|string|true|the virtual machine's uuid|

> Example responses


> OpenApiResponse

```json
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

<h3 id="describevm-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### deleteVm

<a id="opIddeleteVm"></a>

> Code samples

```http
DELETE http://api.yourchimestack.com:8801/v1/vm/{VmUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`DELETE /vm/{VmUuid}`

delete a vm

<h3 id="deletevm-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VmUuid|path|string|true|the virtual machine's uuid|
|force_del|query|string|false|if forceDel is set to true, the physical volumes are deleted as well as the virtual machine|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "3bb72de6-3d03-425b-a004-6b4e1f12c851",
  "result": {
    "vm": "ok"
  }
}
```

<h3 id="deletevm-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### updateVm

<a id="opIdupdateVm"></a>

> Code samples

```http
PATCH http://api.yourchimestack.com:8801/v1/vm/{VmUuid} HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PATCH /vm/{VmUuid}`

update a vm

> Body parameter

```json
{
  "description": "string",
  "name": "string"
}
```

<h3 id="updatevm-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VmUuid|path|string|true|the virtual machine's uuid|
|body|body|[UpdateVmRequest](#schemaupdatevmrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "34847e46-2d0e-4ef0-ba76-65e02b7431e4",
  "result": {
    "vm": "ok"
  }
}
```

<h3 id="updatevm-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### attachVolumeToVm

<a id="opIdattachVolumeToVm"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/vm/{VmUuid}/attach_disk HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PUT /vm/{VmUuid}/attach_disk`

attach a volume to the vm

> Body parameter

```json
{
  "volume_uuid": "string"
}
```

<h3 id="attachvolumetovm-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VmUuid|path|string|true|the virtual machine's uuid|
|body|body|[AttachVolumeRequest](#schemaattachvolumerequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "df148989-d472-4f7a-ae83-5c5ac77d8a52",
  "result": {
    "vm": "ok"
  }
}
```

<h3 id="attachvolumetovm-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### attachNicToVm

<a id="opIdattachNicToVm"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/vm/{VmUuid}/attach_nic HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PUT /vm/{VmUuid}/attach_nic`

attach a nic to the vm

> Body parameter

```json
{
  "nic_uuid": "string"
}
```

<h3 id="attachnictovm-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VmUuid|path|string|true|the virtual machine's uuid|
|body|body|[AttachNicRequest](#schemaattachnicrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "a939c0ef-ec0c-4e71-b29b-c900d929f5d0",
  "result": {
    "vm": "ok"
  }
}
```

<h3 id="attachnictovm-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### detachVolumeFromVm

<a id="opIddetachVolumeFromVm"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/vm/{VmUuid}/detach_disk HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PUT /vm/{VmUuid}/detach_disk`

detach a volume from the vm

> Body parameter

```json
{
  "volume_uuid": "string"
}
```

<h3 id="detachvolumefromvm-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VmUuid|path|string|true|the virtual machine's uuid|
|body|body|[DetachVolumeRequest](#schemadetachvolumerequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "cb41cf74-b3bc-4522-9e8c-0bddd379f1e6",
  "result": {
    "vm": "ok"
  }
}
```

<h3 id="detachvolumefromvm-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### detachNicFromVm

<a id="opIddetachNicFromVm"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/vm/{VmUuid}/detach_nic HTTP/1.1
Host: api.yourchimestack.com:8801
Content-Type: application/json
Accept: application/json

```

`PUT /vm/{VmUuid}/detach_nic`

detach a nic from the vm

> Body parameter

```json
{
  "nic_uuid": "string"
}
```

<h3 id="detachnicfromvm-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VmUuid|path|string|true|the virtual machine's uuid|
|body|body|[DetachNicRequest](#schemadetachnicrequest)|false|the http post body|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "c6eac3d4-67e8-4e39-a585-3d64a352c2ac",
  "result": {
    "vm": "ok"
  }
}
```

<h3 id="detachnicfromvm-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### startVm

<a id="opIdstartVm"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/vm/{VmUuid}/start HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`PUT /vm/{VmUuid}/start`

start a vm

<h3 id="startvm-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VmUuid|path|string|true|the virtual machine's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "c4214cf2-094a-4797-ad59-87f99a833239",
  "result": {
    "vm": "ok"
  }
}
```

<h3 id="startvm-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### stopVm

<a id="opIdstopVm"></a>

> Code samples

```http
PUT http://api.yourchimestack.com:8801/v1/vm/{VmUuid}/stop HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`PUT /vm/{VmUuid}/stop`

stop a vm

<h3 id="stopvm-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VmUuid|path|string|true|the virtual machine's uuid|

> Example responses


> OpenApiResponse

```json
{
  "requestId": "ab8daf9f-e4ad-4c1d-b5bc-58bfb4b1ed43",
  "result": {
    "vm": "ok"
  }
}
```

<h3 id="stopvm-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getVmVnc

<a id="opIdgetVmVnc"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/vm/{VmUuid}/vnc HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /vm/{VmUuid}/vnc`

get a vm vnc information

<h3 id="getvmvnc-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|VmUuid|path|string|true|the virtual machine's uuid|

> Example responses


<h3 id="getvmvnc-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

### getVmStatistic

<a id="opIdgetVmStatistic"></a>

> Code samples

```http
GET http://api.yourchimestack.com:8801/v1/vm_statistic HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /vm_statistic`

describe vm statistic

> Example responses


<h3 id="getvmstatistic-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|
|default|Default|OpenApiResponse|[OpenApiResponse](#schemaopenapiresponse)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
api_key
</aside>

## Schema Reference

### AcceptAlertRequest
<!-- backwards compatibility -->
<a id="schemaacceptalertrequest"></a>
<a id="schema_AcceptAlertRequest"></a>
<a id="tocSacceptalertrequest"></a>
<a id="tocsacceptalertrequest"></a>

```json
{
  "comment": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|comment|string|false|none|comment for the alert's acception|

### AttachNicRequest
<!-- backwards compatibility -->
<a id="schemaattachnicrequest"></a>
<a id="schema_AttachNicRequest"></a>
<a id="tocSattachnicrequest"></a>
<a id="tocsattachnicrequest"></a>

```json
{
  "nic_uuid": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|nic_uuid|string|false|none|the network interface's uuid|

### AttachVolumeRequest
<!-- backwards compatibility -->
<a id="schemaattachvolumerequest"></a>
<a id="schema_AttachVolumeRequest"></a>
<a id="tocSattachvolumerequest"></a>
<a id="tocsattachvolumerequest"></a>

```json
{
  "volume_uuid": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|volume_uuid|string|false|none|the virtual machine's uuid|

### AuthRequest
<!-- backwards compatibility -->
<a id="schemaauthrequest"></a>
<a id="schema_AuthRequest"></a>
<a id="tocSauthrequest"></a>
<a id="tocsauthrequest"></a>

```json
{
  "token": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|token|string|false|none|the authorized token string|

### CommonError
<!-- backwards compatibility -->
<a id="schemacommonerror"></a>
<a id="schema_CommonError"></a>
<a id="tocScommonerror"></a>
<a id="tocscommonerror"></a>

```json
{
  "code": 0,
  "message": "string",
  "status": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|code|integer(int64)|false|none|none|
|message|string|false|none|none|
|status|string|false|none|none|

### CreateAzRequest
<!-- backwards compatibility -->
<a id="schemacreateazrequest"></a>
<a id="schema_CreateAzRequest"></a>
<a id="tocScreateazrequest"></a>
<a id="tocscreateazrequest"></a>

```json
{
  "description": "string",
  "name": "string",
  "parent": "string"
}

```

az request

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|description|string|false|none|description for the AZ|
|name|string|false|none|the AZ's name|
|parent|string|false|none|none|

### CreateCdromRequest
<!-- backwards compatibility -->
<a id="schemacreatecdromrequest"></a>
<a id="schema_CreateCdromRequest"></a>
<a id="tocScreatecdromrequest"></a>
<a id="tocscreatecdromrequest"></a>

```json
{
  "bootable": 0,
  "host_uuid": "string",
  "image_uuid": "string",
  "name": "string",
  "volume_spec_uuid": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|bootable|integer(int64)|false|none|whether to boot the VM from the cdrom, default is 0 (not)|
|host_uuid|string|false|none|the host's uuid|
|image_uuid|string|false|none|the image's uuid|
|name|string|false|none|the cdrom's name|
|volume_spec_uuid|string|false|none|the volume specification's Uuid|

### CreateClusterInstanceSpecRequest
<!-- backwards compatibility -->
<a id="schemacreateclusterinstancespecrequest"></a>
<a id="schema_CreateClusterInstanceSpecRequest"></a>
<a id="tocScreateclusterinstancespecrequest"></a>
<a id="tocscreateclusterinstancespecrequest"></a>

```json
{
  "instance_spec_uuid": "string"
}

```

cluster instance spec relation request

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|instance_spec_uuid|string|false|none|the instance specification's Uuid|

### CreateClusterRequest
<!-- backwards compatibility -->
<a id="schemacreateclusterrequest"></a>
<a id="schema_CreateClusterRequest"></a>
<a id="tocScreateclusterrequest"></a>
<a id="tocscreateclusterrequest"></a>

```json
{
  "arch": "string",
  "description": "string",
  "hypervisor_type": "string",
  "name": "string",
  "type": 0
}

```

cluster request

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|arch|string|false|none|the cluster's architecture, like x86_64, arm, ...|
|description|string|false|none|description for the cluster|
|hypervisor_type|string|false|none|the cluster's hypervisor type, like kvm (default), xen, ...|
|name|string|false|none|the cluster's name|
|type|integer(int64)|false|none|the cluster's type|

### CreateClusterVolumeSpecRequest
<!-- backwards compatibility -->
<a id="schemacreateclustervolumespecrequest"></a>
<a id="schema_CreateClusterVolumeSpecRequest"></a>
<a id="tocScreateclustervolumespecrequest"></a>
<a id="tocscreateclustervolumespecrequest"></a>

```json
{
  "volume_spec_uuid": "string"
}

```

cluster volume spec relation request

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|volume_spec_uuid|string|false|none|the volume specification's Uuid|

### CreateHostRequest
<!-- backwards compatibility -->
<a id="schemacreatehostrequest"></a>
<a id="schema_CreateHostRequest"></a>
<a id="tocScreatehostrequest"></a>
<a id="tocscreatehostrequest"></a>

```json
{
  "cpu_ratio": 0.1,
  "description": "string",
  "memory_ratio": 0.1,
  "reserved_memory": 0,
  "reserved_vcpus": 0,
  "uuid": "string"
}

```

host request

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|cpu_ratio|number(float)|false|none|the CPU's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical CPUs in the node.|
|description|string|false|none|description for the host|
|memory_ratio|number(float)|false|none|the memory's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical memory in the node.|
|reserved_memory|integer(int64)|false|none|the reserverd memory number, which will not be allocated to virtual machines.|
|reserved_vcpus|integer(int64)|false|none|the reserverd CPU number, which will not be allocated to virtual machines.|
|uuid|string|false|none|the host's Uuid|

### CreateImageBucketRequest
<!-- backwards compatibility -->
<a id="schemacreateimagebucketrequest"></a>
<a id="schema_CreateImageBucketRequest"></a>
<a id="tocScreateimagebucketrequest"></a>
<a id="tocscreateimagebucketrequest"></a>

```json
{
  "bucket_name": "string",
  "description": "string",
  "name": "string",
  "type": 0
}

```

image bucket request

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|bucket_name|string|false|none|the bucket's name from the S3's service|
|description|string|false|none|description for the image bucket|
|name|string|false|none|the image bucket's name|
|type|integer(int64)|false|none|the image bucket's type, can be 'private' or 'public'|

### CreateImageRequest
<!-- backwards compatibility -->
<a id="schemacreateimagerequest"></a>
<a id="schema_CreateImageRequest"></a>
<a id="tocScreateimagerequest"></a>
<a id="tocscreateimagerequest"></a>

```json
{
  "boot_type": "string",
  "description": "string",
  "format": "string",
  "install_url": "string",
  "name": "string",
  "os_arch": "string",
  "os_detail": "string",
  "os_type": "string",
  "shared": 0
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|boot_type|string|false|none|the boot type of the image, can be UEFI or legacy|
|description|string|false|none|description for the image|
|format|string|false|none|the image's format, like raw, qcow2, ...|
|install_url|string|false|none|the installation uri of the image to be fetched, it can be a sftp url or a file local path in the server's running node|
|name|string|false|none|the image's name|
|os_arch|string|false|none|the architecture of the OS, like x86_64, arm, ...|
|os_detail|string|false|none|the version of the OS, like CentOS 7, CentOS 8, ...|
|os_type|string|false|none|the operation system's type, like Windows, Linux, ...|
|shared|integer(int64)|false|none|whether the image is shared with other accounts or not|

### CreateInstanceSpecRequest
<!-- backwards compatibility -->
<a id="schemacreateinstancespecrequest"></a>
<a id="schema_CreateInstanceSpecRequest"></a>
<a id="tocScreateinstancespecrequest"></a>
<a id="tocscreateinstancespecrequest"></a>

```json
{
  "description": "string",
  "memory": 0,
  "name": "string",
  "type": 0,
  "vcpus": 0
}

```

instance spec request

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|description|string|false|none|description for the instance specification|
|memory|integer(int64)|false|none|the number of memory|
|name|string|false|none|the instance specification's name|
|type|integer(int64)|false|none|the instance specification's type, 0: shared resource, 1: dedicated resource|
|vcpus|integer(int64)|false|none|the number of vCPUs|

### CreateNetworkRequest
<!-- backwards compatibility -->
<a id="schemacreatenetworkrequest"></a>
<a id="schema_CreateNetworkRequest"></a>
<a id="tocScreatenetworkrequest"></a>
<a id="tocscreatenetworkrequest"></a>

```json
{
  "description": "string",
  "interface_name": "string",
  "name": "string",
  "type": 0
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|description|string|false|none|description for the network|
|interface_name|string|false|none|the unified interface name which the network uses in the node|
|name|string|false|none|the network's name|
|type|integer(int64)|false|none|the network's type, can be: classical, vlan and vxlan|

### CreateNicRequest
<!-- backwards compatibility -->
<a id="schemacreatenicrequest"></a>
<a id="schema_CreateNicRequest"></a>
<a id="tocScreatenicrequest"></a>
<a id="tocscreatenicrequest"></a>

```json
{
  "description": "string",
  "ip": "string",
  "name": "string",
  "primary": 0,
  "subnet_uuid": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|description|string|false|none|description for the nic|
|ip|string|false|none|the IP address of the nic|
|name|string|false|none|the virtual network interface's name|
|primary|integer(int64)|false|none|whether the nic is the primary nic, which can not be removed from a virtual machine|
|subnet_uuid|string|false|none|the subnet's Uuid, which the nic belongs to|

### CreateSnapshotRequest
<!-- backwards compatibility -->
<a id="schemacreatesnapshotrequest"></a>
<a id="schema_CreateSnapshotRequest"></a>
<a id="tocScreatesnapshotrequest"></a>
<a id="tocscreatesnapshotrequest"></a>

```json
{
  "description": "string",
  "name": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|description|string|false|none|description for the snapshot|
|name|string|false|none|the snapshot's name|

### CreateStoragePoolRequest
<!-- backwards compatibility -->
<a id="schemacreatestoragepoolrequest"></a>
<a id="schema_CreateStoragePoolRequest"></a>
<a id="tocScreatestoragepoolrequest"></a>
<a id="tocscreatestoragepoolrequest"></a>

```json
{
  "backend_path": "string",
  "description": "string",
  "image_cache_path": "string",
  "name": "string",
  "physical_size": 0,
  "reserved_size": 0,
  "size_ratio": 0.1,
  "type": 0
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|backend_path|string|false|none|the backend path of the physical storage in nodes (only for local storage)|
|description|string|false|none|description for the storage pool|
|image_cache_path|string|false|none|the image cache path of the physical storage in nodes (only for local storage)|
|name|string|false|none|the storage pool's name|
|physical_size|integer(int64)|false|none|the physical size of the storage|
|reserved_size|integer(int64)|false|none|the reserverd storage size, which will not be allocated to virtual machines.|
|size_ratio|number(float)|false|none|the storage's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical storage|
|type|integer(int64)|false|none|the storage pool's type, 0: local, 1:iscsi, 2:ceph|

### CreateSubnetRequest
<!-- backwards compatibility -->
<a id="schemacreatesubnetrequest"></a>
<a id="schema_CreateSubnetRequest"></a>
<a id="tocScreatesubnetrequest"></a>
<a id="tocscreatesubnetrequest"></a>

```json
{
  "cidr": "string",
  "description": "string",
  "gateway": "string",
  "name": "string",
  "reserved_ips": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|cidr|string|false|none|the CIDR value, e.g. 192.168.231.1/24|
|description|string|false|none|description for the subnet|
|gateway|string|false|none|the gateway of the subnet|
|name|string|false|none|the subnet's name|
|reserved_ips|string|false|none|the reserved ips inside the subnet, which will not be assigned to virtual machines|

### CreateUserDefaultRequest
<!-- backwards compatibility -->
<a id="schemacreateuserdefaultrequest"></a>
<a id="schema_CreateUserDefaultRequest"></a>
<a id="tocScreateuserdefaultrequest"></a>
<a id="tocscreateuserdefaultrequest"></a>

```json
{
  "az_uuid": "string",
  "clusters_uuid": "string"
}

```

user default request

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|az_uuid|string|false|none|the AZ's uuid|
|clusters_uuid|string|false|none|the cluster's uuid|

### CreateUserRequest
<!-- backwards compatibility -->
<a id="schemacreateuserrequest"></a>
<a id="schema_CreateUserRequest"></a>
<a id="tocScreateuserrequest"></a>
<a id="tocscreateuserrequest"></a>

```json
{
  "avatar": "string",
  "name": "string",
  "nick_name": "string",
  "password": "string",
  "role": 0
}

```

user  request

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|avatar|string|false|none|the user's avatar|
|name|string|false|none|the user's name|
|nick_name|string|false|none|the user's nickname|
|password|string|false|none|the user's login password|
|role|integer(int64)|false|none|the user's role, 0: normal user, 1: readonly administrator, 2: administrator, 3: super administrator|

### CreateVmRequest
<!-- backwards compatibility -->
<a id="schemacreatevmrequest"></a>
<a id="schema_CreateVmRequest"></a>
<a id="tocScreatevmrequest"></a>
<a id="tocscreatevmrequest"></a>

```json
{
  "az_uuid": "string",
  "cdrom": {
    "bootable": 0,
    "host_uuid": "string",
    "image_uuid": "string",
    "name": "string",
    "volume_spec_uuid": "string"
  },
  "cluster_uuid": "string",
  "description": "string",
  "host_uuid": "string",
  "instance_spec_uuid": "string",
  "name": "string",
  "nics": [
    {
      "description": "string",
      "ip": "string",
      "name": "string",
      "primary": 0,
      "subnet_uuid": "string"
    }
  ],
  "password": "string",
  "vnc_password": "string",
  "volumes": [
    {
      "description": "string",
      "host_uuid": "string",
      "image_uuid": "string",
      "name": "string",
      "root": 0,
      "size": 0,
      "volume_spec_uuid": "string"
    }
  ]
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|az_uuid|string|false|none|the AZ's uuid|
|cdrom|[CreateCdromRequest](#schemacreatecdromrequest)|false|none|none|
|cluster_uuid|string|false|none|the cluster's uuid|
|description|string|false|none|description for the virtual machine|
|host_uuid|string|false|none|the host's uuid|
|instance_spec_uuid|string|false|none|the instace specification's uuid|
|name|string|false|none|the virtual machine's name|
|nics|[[CreateNicRequest](#schemacreatenicrequest)]|false|none|the network interfaces of the virtual machine|
|password|string|false|none|the SSH password of the root user|
|vnc_password|string|false|none|the VNC password|
|volumes|[[CreateVolumeRequest](#schemacreatevolumerequest)]|false|none|the volumes of the virutal machine|

### CreateVolumeRequest
<!-- backwards compatibility -->
<a id="schemacreatevolumerequest"></a>
<a id="schema_CreateVolumeRequest"></a>
<a id="tocScreatevolumerequest"></a>
<a id="tocscreatevolumerequest"></a>

```json
{
  "description": "string",
  "host_uuid": "string",
  "image_uuid": "string",
  "name": "string",
  "root": 0,
  "size": 0,
  "volume_spec_uuid": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|description|string|false|none|description for the volume|
|host_uuid|string|false|none|the host's uuid if the volume is on local storage|
|image_uuid|string|false|none|the image's uuid|
|name|string|false|none|the volume's name|
|root|integer(int64)|false|none|whether the volume is the root volume, which is not removable|
|size|integer(int64)|false|none|the size of the volume in bytes|
|volume_spec_uuid|string|false|none|the volume specification's Uuid|

### CreateVolumeSpecRequest
<!-- backwards compatibility -->
<a id="schemacreatevolumespecrequest"></a>
<a id="schema_CreateVolumeSpecRequest"></a>
<a id="tocScreatevolumespecrequest"></a>
<a id="tocscreatevolumespecrequest"></a>

```json
{
  "description": "string",
  "max_iops": 0,
  "max_throughput": 0,
  "min_iops": 0,
  "min_throughput": 0,
  "name": "string",
  "step_iops": 0,
  "step_throughput": 0,
  "storage_pool_uuid": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|description|string|false|none|description for the volume specification|
|max_iops|integer(int64)|false|none|the max iops value of the volume specification|
|max_throughput|integer(int64)|false|none|the max throughput value of the volume specification|
|min_iops|integer(int64)|false|none|the min iops value of the volume specification|
|min_throughput|integer(int64)|false|none|the min throughput value of the volume specification|
|name|string|false|none|the volume specification's name|
|step_iops|integer(int64)|false|none|the step iops value of the volume specification|
|step_throughput|integer(int64)|false|none|the step throughput value of the volume specification|
|storage_pool_uuid|string|false|none|the storage pool's Uuid|

### DetachNicRequest
<!-- backwards compatibility -->
<a id="schemadetachnicrequest"></a>
<a id="schema_DetachNicRequest"></a>
<a id="tocSdetachnicrequest"></a>
<a id="tocsdetachnicrequest"></a>

```json
{
  "nic_uuid": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|nic_uuid|string|false|none|the network interface's uuid|

### DetachVolumeRequest
<!-- backwards compatibility -->
<a id="schemadetachvolumerequest"></a>
<a id="schema_DetachVolumeRequest"></a>
<a id="tocSdetachvolumerequest"></a>
<a id="tocsdetachvolumerequest"></a>

```json
{
  "volume_uuid": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|volume_uuid|string|false|none|the virtual machine's uuid|

### LoginRequest
<!-- backwards compatibility -->
<a id="schemaloginrequest"></a>
<a id="schema_LoginRequest"></a>
<a id="tocSloginrequest"></a>
<a id="tocsloginrequest"></a>

```json
{
  "password": "string",
  "user_name": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|password|string|false|none|the password for authing|
|user_name|string|false|none|the username for authing|

### OpenApiResponse
<!-- backwards compatibility -->
<a id="schemaopenapiresponse"></a>
<a id="schema_OpenApiResponse"></a>
<a id="tocSopenapiresponse"></a>
<a id="tocsopenapiresponse"></a>

```json
{
  "error": {
    "code": 0,
    "message": "string",
    "status": "string"
  },
  "requestId": "string",
  "result": null
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|error|[CommonError](#schemacommonerror)|false|none|none|
|requestId|string|false|none|in: body|
|result|any|false|none|in: body|

### UpdateHostRequest
<!-- backwards compatibility -->
<a id="schemaupdatehostrequest"></a>
<a id="schema_UpdateHostRequest"></a>
<a id="tocSupdatehostrequest"></a>
<a id="tocsupdatehostrequest"></a>

```json
{
  "cpu_ratio": 0.1,
  "description": "string",
  "memory_ratio": 0.1,
  "reserved_memory": 0,
  "reserved_vcpus": 0
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|cpu_ratio|number(float)|false|none|the CPU's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical CPUs in the node.|
|description|string|false|none|description for the host|
|memory_ratio|number(float)|false|none|the memory's allocation ratio, e.g. a value of 2.0 stands for up to allocate double size of the physical memory in the node.|
|reserved_memory|integer(int64)|false|none|the reserverd memory number, which will not be allocated to virtual machines.|
|reserved_vcpus|integer(int64)|false|none|the reserverd CPU number, which will not be allocated to virtual machines.|

### UpdateImageRequest
<!-- backwards compatibility -->
<a id="schemaupdateimagerequest"></a>
<a id="schema_UpdateImageRequest"></a>
<a id="tocSupdateimagerequest"></a>
<a id="tocsupdateimagerequest"></a>

```json
{
  "boot_type": "string",
  "description": "string",
  "format": "string",
  "name": "string",
  "os_arch": "string",
  "os_detail": "string",
  "os_type": "string",
  "shared": 0
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|boot_type|string|false|none|the boot type of the image, can be UEFI or legacy|
|description|string|false|none|description for the image|
|format|string|false|none|the image's format, like raw, qcow2, ...|
|name|string|false|none|the image's name|
|os_arch|string|false|none|the architecture of the OS, like x86_64, arm, ...|
|os_detail|string|false|none|the version of the OS, like CentOS 7, CentOS 8, ...|
|os_type|string|false|none|the operation system's type, like Windows, Linux, ...|
|shared|integer(int64)|false|none|whether the image is shared with other accounts or not|

### UpdateNetworkRequest
<!-- backwards compatibility -->
<a id="schemaupdatenetworkrequest"></a>
<a id="schema_UpdateNetworkRequest"></a>
<a id="tocSupdatenetworkrequest"></a>
<a id="tocsupdatenetworkrequest"></a>

```json
{
  "description": "string",
  "name": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|description|string|false|none|description for the network|
|name|string|false|none|the network's name|

### UpdateNicRequest
<!-- backwards compatibility -->
<a id="schemaupdatenicrequest"></a>
<a id="schema_UpdateNicRequest"></a>
<a id="tocSupdatenicrequest"></a>
<a id="tocsupdatenicrequest"></a>

```json
{
  "description": "string",
  "name": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|description|string|false|none|description for the nic|
|name|string|false|none|the nic's name|

### UpdateVmRequest
<!-- backwards compatibility -->
<a id="schemaupdatevmrequest"></a>
<a id="schema_UpdateVmRequest"></a>
<a id="tocSupdatevmrequest"></a>
<a id="tocsupdatevmrequest"></a>

```json
{
  "description": "string",
  "name": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|description|string|false|none|description for the virutal machine|
|name|string|false|none|the virutal machine's name|

### UpdateVolumeRequest
<!-- backwards compatibility -->
<a id="schemaupdatevolumerequest"></a>
<a id="schema_UpdateVolumeRequest"></a>
<a id="tocSupdatevolumerequest"></a>
<a id="tocsupdatevolumerequest"></a>

```json
{
  "description": "string",
  "name": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|description|string|false|none|description for the volume|
|name|string|false|none|the volume's name|

