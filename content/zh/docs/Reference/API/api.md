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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|integer(int64)|false|none|
|severity|query|integer(int64)|false|none|
|priority|query|integer(int64)|false|none|

> Example responses

> 200 Response

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

describe a alert

<h3 id="getalert-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AlertUuid|path|string|true|none|

> Example responses

> 200 Response

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

delete a alert

<h3 id="deletealert-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|AlertUuid|path|string|true|none|

> Example responses

> 200 Response

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

accept a alert

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
|body|body|[AcceptAlertRequest](#schemaacceptalertrequest)|false|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|integer(int64)|false|none|
|severity|query|integer(int64)|false|none|
|priority|query|integer(int64)|false|none|

> Example responses

> 200 Response

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

describe a alert rule

<h3 id="getalertrule-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|RuleUuid|path|string|true|none|

> Example responses

> 200 Response

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

describe alert statistic

> Example responses

> 200 Response

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
|body|body|[AuthRequest](#schemaauthrequest)|false|none|

> Example responses

> 200 Response

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
|body|body|[LoginRequest](#schemaloginrequest)|false|none|

> Example responses

> 200 Response

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
|body|body|[AuthRequest](#schemaauthrequest)|false|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|role|query|integer(int64)|false|none|

> Example responses

> 200 Response

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
|body|body|[CreateUserRequest](#schemacreateuserrequest)|false|none|

> Example responses

> 200 Response

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
|UserUuid|path|string|true|none|

> Example responses

> 200 Response

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
|UserUuid|path|string|true|none|

> Example responses

> 200 Response

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
|UserUuid|path|string|true|none|
|body|body|[CreateUserRequest](#schemacreateuserrequest)|false|none|

> Example responses

> 200 Response

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
|UserUuid|path|string|true|none|

> Example responses

> 200 Response

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
|UserUuid|path|string|true|none|
|body|body|[CreateUserDefaultRequest](#schemacreateuserdefaultrequest)|true|This text will appear as description of your request body.|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|integer(int64)|false|none|

> Example responses

> 200 Response

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
|body|body|[CreateAzRequest](#schemacreateazrequest)|false|This text will appear as description of your request body.|

> Example responses

> OpenApiResponse

```json
{
  "requestId": "ae40a6b7-b806-4590-8da2-2b4b3cc78896",
  "error": null,
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
|AzUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|body|body|[CreateAzRequest](#schemacreateazrequest)|true|This text will appear as description of your request body.|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|integer(int64)|false|none|
|type|query|integer(int64)|false|none|
|hypervisor_type|query|string|false|none|
|arch|query|string|false|none|
|AzUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|body|body|[CreateClusterRequest](#schemacreateclusterrequest)|false|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|body|body|[CreateClusterRequest](#schemacreateclusterrequest)|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|integer(int64)|false|none|
|rack_name|query|string|false|none|
|manage_ip|query|string|false|none|
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|body|body|[CreateHostRequest](#schemacreatehostrequest)|false|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|HostUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|HostUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|HostUuid|path|string|true|none|
|body|body|[UpdateHostRequest](#schemaupdatehostrequest)|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|HostUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|HostUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|HostUuid|path|string|true|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|integer(int64)|false|none|
|rack_name|query|string|false|none|
|manage_ip|query|string|false|none|
|all|query|integer(int64)|false|none|

> Example responses

> 200 Response

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
|cluster_uuid|query|string|false|in:qeury|
|host_uuid|query|string|false|in:qeury|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|body|body|[CreateClusterInstanceSpecRequest](#schemacreateclusterinstancespecrequest)|false|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|InstanceSpecUuid|path|string|true|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|type|query|integer(int64)|false|none|

> Example responses

> 200 Response

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
|body|body|[CreateInstanceSpecRequest](#schemacreateinstancespecrequest)|false|none|

> Example responses

> 200 Response

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
|InstanceSpecUuid|path|string|true|none|

> Example responses

> 200 Response

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
|InstanceSpecUuid|path|string|true|none|

> Example responses

> 200 Response

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
|InstanceSpecUuid|path|string|true|none|
|body|body|[CreateInstanceSpecRequest](#schemacreateinstancespecrequest)|true|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|integer(int64)|false|none|
|type|query|integer(int64)|false|none|
|interface_name|query|string|false|none|
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|body|body|[CreateNetworkRequest](#schemacreatenetworkrequest)|false|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|NetworkUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|NetworkUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|NetworkUuid|path|string|true|none|
|body|body|[UpdateNetworkRequest](#schemaupdatenetworkrequest)|false|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|integer(int64)|false|none|
|type|query|integer(int64)|false|none|
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|NetworkUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|NetworkUuid|path|string|true|none|
|body|body|[CreateSubnetRequest](#schemacreatesubnetrequest)|false|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|NetworkUuid|path|string|true|none|
|SubnetUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|NetworkUuid|path|string|true|none|
|SubnetUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|NetworkUuid|path|string|true|none|
|SubnetUuid|path|string|true|none|
|body|body|[CreateSubnetRequest](#schemacreatesubnetrequest)|false|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|string|false|none|
|uuid|query|string|false|none|
|subnet_uuid|query|string|false|none|

> Example responses

> 200 Response

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
|body|body|[CreateNicRequest](#schemacreatenicrequest)|false|none|

> Example responses

> 200 Response

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
|NicUuid|path|string|true|none|

> Example responses

> 200 Response

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
|NicUuid|path|string|true|none|
|force_del|query|string|false|none|

> Example responses

> 200 Response

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
|NicUuid|path|string|true|none|
|body|body|[UpdateNicRequest](#schemaupdatenicrequest)|false|none|

> Example responses

> 200 Response

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

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|integer(int64)|false|none|
|type|query|integer(int64)|false|none|
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|body|body|[CreateStoragePoolRequest](#schemacreatestoragepoolrequest)|false|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|StoragePoolUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|StoragePoolUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|StoragePoolUuid|path|string|true|none|
|body|body|[CreateStoragePoolRequest](#schemacreatestoragepoolrequest)|false|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|integer(int64)|false|none|

> Example responses

> 200 Response

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
|cluster_uuid|query|string|false|in:qeury|
|storage_pool_uuid|query|string|false|in:qeury|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|string|false|none|
|uuid|query|string|false|none|
|host_uuid|query|string|false|none|
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|body|body|[CreateVolumeRequest](#schemacreatevolumerequest)|false|none|

> Example responses

> 200 Response

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
|VolumeUuid|path|string|true|none|
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|

> Example responses

> 200 Response

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
|VolumeUuid|path|string|true|none|
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|force_del|query|string|false|none|

> Example responses

> 200 Response

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
|VolumeUuid|path|string|true|none|
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|body|body|[UpdateVolumeRequest](#schemaupdatevolumerequest)|false|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|string|false|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|integer(int64)|false|none|
|VolumeUuid|path|string|true|none|

> Example responses

> 200 Response

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
|VolumeUuid|path|string|true|none|
|body|body|[CreateSnapshotRequest](#schemacreatesnapshotrequest)|false|none|

> Example responses

> 200 Response

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
|VolumeUuid|path|string|true|none|
|SnapshotUuid|path|string|true|none|

> Example responses

> 200 Response

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
|VolumeUuid|path|string|true|none|
|SnapshotUuid|path|string|true|none|

> Example responses

> 200 Response

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
|VolumeUuid|path|string|true|none|
|SnapshotUuid|path|string|true|none|
|body|body|[CreateSnapshotRequest](#schemacreatesnapshotrequest)|false|none|

> Example responses

> 200 Response

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
|VolumeUuid|path|string|true|none|
|SnapshotUuid|path|string|true|none|

> Example responses

> 200 Response

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

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|body|body|[CreateClusterVolumeSpecRequest](#schemacreateclustervolumespecrequest)|false|none|

> Example responses

> 200 Response

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
|AzUuid|path|string|true|none|
|ClusterUuid|path|string|true|none|
|VolumeSpecUuid|path|string|true|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|storage_pool_uuid|query|string|false|none|

> Example responses

> 200 Response

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
|body|body|[CreateVolumeSpecRequest](#schemacreatevolumespecrequest)|false|none|

> Example responses

> 200 Response

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
|VolumeSpecUuid|path|string|true|none|

> Example responses

> 200 Response

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
|VolumeSpecUuid|path|string|true|none|

> Example responses

> 200 Response

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
|VolumeSpecUuid|path|string|true|none|
|body|body|[CreateVolumeSpecRequest](#schemacreatevolumespecrequest)|true|none|

> Example responses

> 200 Response

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
|Token|query|string|true|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|string|false|none|
|format|query|string|false|none|
|os_type|query|string|false|none|
|type|query|integer(int64)|false|none|
|uuid|query|string|false|none|
|bucket_uuid|query|string|false|none|

> Example responses

> 200 Response

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
|body|body|[CreateImageRequest](#schemacreateimagerequest)|false|none|

> Example responses

> 200 Response

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

create a user image

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
|body|body|[CreateImageRequest](#schemacreateimagerequest)|false|none|

> Example responses

> 200 Response

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

describe a image

<h3 id="getimage-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|ImageUuid|path|string|true|none|

> Example responses

> 200 Response

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

delete a image

<h3 id="deleteimage-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|ImageUuid|path|string|true|none|

> Example responses

> 200 Response

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

update an image

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
|body|body|[UpdateImageRequest](#schemaupdateimagerequest)|false|none|

> Example responses

> 200 Response

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

describe s3 inventory statistic

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|integer(int64)|false|none|
|type|query|integer(int64)|false|none|

> Example responses

> 200 Response

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

create a image bucket

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
|body|body|[CreateImageBucketRequest](#schemacreateimagebucketrequest)|false|none|

> Example responses

> 200 Response

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

describe a image bucket

<h3 id="getimagebucket-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|ImageBucketUuid|path|string|true|none|

> Example responses

> 200 Response

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

delete a image bucket

<h3 id="deleteimagebucket-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|ImageBucketUuid|path|string|true|none|

> Example responses

> 200 Response

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
GET http://api.yourchimestack.com:8801/v1/metrics/cpu HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/cpu`

get vm cpu statistics

<h3 id="getcpustats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|false|none|
|window|query|integer(int64)|false|none|
|vm_uuid|query|string|false|none|

> Example responses

> 200 Response

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
GET http://api.yourchimestack.com:8801/v1/metrics/disk_io HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/disk_io`

get vm disk i/o statistics

<h3 id="getdiskiostats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|false|none|
|window|query|integer(int64)|false|none|
|vm_uuid|query|string|false|none|

> Example responses

> 200 Response

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
GET http://api.yourchimestack.com:8801/v1/metrics/interface_net_io HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/interface_net_io`

get interface net i/o statistics

<h3 id="getinterfacenetiostats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|false|none|
|window|query|integer(int64)|false|none|
|interface_uuid|query|string|false|none|

> Example responses

> 200 Response

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
GET http://api.yourchimestack.com:8801/v1/metrics/memory HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/memory`

get vm memory statistics

<h3 id="getmemorystats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|false|none|
|window|query|integer(int64)|false|none|
|vm_uuid|query|string|false|none|

> Example responses

> 200 Response

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
GET http://api.yourchimestack.com:8801/v1/metrics/net_io HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/net_io`

get vm network i/o statistics

<h3 id="getnetiostats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|false|none|
|window|query|integer(int64)|false|none|
|vm_uuid|query|string|false|none|

> Example responses

> 200 Response

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
GET http://api.yourchimestack.com:8801/v1/metrics/total_cpu HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/total_cpu`

get total cpu statistics

<h3 id="gettotalcpustats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|false|none|
|window|query|integer(int64)|false|none|

> Example responses

> 200 Response

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
GET http://api.yourchimestack.com:8801/v1/metrics/total_disk_io HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/total_disk_io`

get total disk i/o statistics

<h3 id="gettotaldiskiostats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|false|none|
|window|query|integer(int64)|false|none|

> Example responses

> 200 Response

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
GET http://api.yourchimestack.com:8801/v1/metrics/total_memory HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/total_memory`

get total memory statistics

<h3 id="gettotalmemorystats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|false|none|
|window|query|integer(int64)|false|none|

> Example responses

> 200 Response

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
GET http://api.yourchimestack.com:8801/v1/metrics/total_net_io HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/total_net_io`

get total network i/o statistics

<h3 id="gettotalnetiostats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|false|none|
|window|query|integer(int64)|false|none|

> Example responses

> 200 Response

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
GET http://api.yourchimestack.com:8801/v1/metrics/user_cpu HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/user_cpu`

get user total cpu statistics

<h3 id="getusercpustats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|false|none|
|window|query|integer(int64)|false|none|

> Example responses

> 200 Response

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
GET http://api.yourchimestack.com:8801/v1/metrics/user_memory HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/user_memory`

get user total memory statistics

<h3 id="getusermemorystats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|false|none|
|window|query|integer(int64)|false|none|

> Example responses

> 200 Response

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
GET http://api.yourchimestack.com:8801/v1/metrics/volume_disk_io HTTP/1.1
Host: api.yourchimestack.com:8801
Accept: application/json

```

`GET /metrics/volume_disk_io`

get volume disk i/o statistics

<h3 id="getvolumediskiostats-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|range|query|integer(int64)|false|none|
|window|query|integer(int64)|false|none|
|volume_uuid|query|string|false|none|

> Example responses

> 200 Response

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
|page|query|integer(int64)|false|none|
|size|query|integer(int64)|false|none|
|sort|query|string|false|none|
|order|query|string|false|none|
|name|query|string|false|none|
|state|query|string|false|none|
|uuid|query|string|false|none|
|host_uuid|query|string|false|none|
|az_uuid|query|string|false|none|
|cluster_uuid|query|string|false|none|

> Example responses

> 200 Response

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
|body|body|[CreateVmRequest](#schemacreatevmrequest)|false|none|

> Example responses

> 200 Response

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
|VmUuid|path|string|true|none|

> Example responses

> 200 Response

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
|VmUuid|path|string|true|none|
|force_del|query|string|false|none|

> Example responses

> 200 Response

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
|VmUuid|path|string|true|none|
|body|body|[UpdateVmRequest](#schemaupdatevmrequest)|false|none|

> Example responses

> 200 Response

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
|VmUuid|path|string|true|none|
|body|body|[AttachVolumeRequest](#schemaattachvolumerequest)|false|none|

> Example responses

> 200 Response

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
|VmUuid|path|string|true|none|
|body|body|[AttachNicRequest](#schemaattachnicrequest)|false|none|

> Example responses

> 200 Response

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
|VmUuid|path|string|true|none|
|body|body|[DetachVolumeRequest](#schemadetachvolumerequest)|false|none|

> Example responses

> 200 Response

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
|VmUuid|path|string|true|none|
|body|body|[DetachNicRequest](#schemadetachnicrequest)|false|none|

> Example responses

> 200 Response

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
|VmUuid|path|string|true|none|

> Example responses

> 200 Response

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
|VmUuid|path|string|true|none|

> Example responses

> 200 Response

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
|VmUuid|path|string|true|none|

> Example responses

> 200 Response

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

> 200 Response

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
|comment|string|false|none|none|

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
|nic_uuid|string|false|none|none|

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
|volume_uuid|string|false|none|none|

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
|token|string|false|none|none|

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
|description|string|false|none|none|
|name|string|false|none|none|
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
|bootable|integer(int64)|false|none|none|
|host_uuid|string|false|none|none|
|image_uuid|string|false|none|none|
|name|string|false|none|none|
|volume_spec_uuid|string|false|none|none|

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
|instance_spec_uuid|string|false|none|none|

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
|arch|string|false|none|none|
|description|string|false|none|none|
|hypervisor_type|string|false|none|none|
|name|string|false|none|none|
|type|integer(int64)|false|none|none|

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
|volume_spec_uuid|string|false|none|none|

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
|cpu_ratio|number(float)|false|none|none|
|description|string|false|none|none|
|memory_ratio|number(float)|false|none|none|
|reserved_memory|integer(int64)|false|none|none|
|reserved_vcpus|integer(int64)|false|none|none|
|uuid|string|false|none|none|

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
|bucket_name|string|false|none|none|
|description|string|false|none|none|
|name|string|false|none|none|
|type|integer(int64)|false|none|none|

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
|boot_type|string|false|none|none|
|description|string|false|none|none|
|format|string|false|none|none|
|install_url|string|false|none|none|
|name|string|false|none|none|
|os_arch|string|false|none|none|
|os_detail|string|false|none|none|
|os_type|string|false|none|none|
|shared|integer(int64)|false|none|none|

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
|description|string|false|none|none|
|memory|integer(int64)|false|none|none|
|name|string|false|none|none|
|type|integer(int64)|false|none|none|
|vcpus|integer(int64)|false|none|none|

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
|description|string|false|none|none|
|interface_name|string|false|none|none|
|name|string|false|none|none|
|type|integer(int64)|false|none|none|

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
|description|string|false|none|none|
|ip|string|false|none|none|
|name|string|false|none|none|
|primary|integer(int64)|false|none|none|
|subnet_uuid|string|false|none|none|

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
|description|string|false|none|none|
|name|string|false|none|none|

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
|backend_path|string|false|none|none|
|description|string|false|none|none|
|image_cache_path|string|false|none|none|
|name|string|false|none|none|
|physical_size|integer(int64)|false|none|none|
|reserved_size|integer(int64)|false|none|none|
|size_ratio|number(float)|false|none|none|
|type|integer(int64)|false|none|none|

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
|cidr|string|false|none|none|
|description|string|false|none|none|
|gateway|string|false|none|none|
|name|string|false|none|none|
|reserved_ips|string|false|none|none|

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
|az_uuid|string|false|none|none|
|clusters_uuid|string|false|none|none|

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
|avatar|string|false|none|none|
|name|string|false|none|none|
|nick_name|string|false|none|none|
|password|string|false|none|none|
|role|integer(int64)|false|none|none|

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
|az_uuid|string|false|none|none|
|cdrom|[CreateCdromRequest](#schemacreatecdromrequest)|false|none|none|
|cluster_uuid|string|false|none|none|
|description|string|false|none|none|
|host_uuid|string|false|none|none|
|instance_spec_uuid|string|false|none|none|
|name|string|false|none|none|
|nics|[[CreateNicRequest](#schemacreatenicrequest)]|false|none|none|
|password|string|false|none|none|
|vnc_password|string|false|none|none|
|volumes|[[CreateVolumeRequest](#schemacreatevolumerequest)]|false|none|none|

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
|description|string|false|none|none|
|host_uuid|string|false|none|none|
|image_uuid|string|false|none|none|
|name|string|false|none|none|
|root|integer(int64)|false|none|none|
|size|integer(int64)|false|none|none|
|volume_spec_uuid|string|false|none|none|

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
|description|string|false|none|none|
|max_iops|integer(int64)|false|none|none|
|max_throughput|integer(int64)|false|none|none|
|min_iops|integer(int64)|false|none|none|
|min_throughput|integer(int64)|false|none|none|
|name|string|false|none|none|
|step_iops|integer(int64)|false|none|none|
|step_throughput|integer(int64)|false|none|none|
|storage_pool_uuid|string|false|none|none|

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
|nic_uuid|string|false|none|none|

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
|volume_uuid|string|false|none|none|

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
|password|string|false|none|none|
|user_name|string|false|none|none|

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
|cpu_ratio|number(float)|false|none|none|
|description|string|false|none|none|
|memory_ratio|number(float)|false|none|none|
|reserved_memory|integer(int64)|false|none|none|
|reserved_vcpus|integer(int64)|false|none|none|

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
|boot_type|string|false|none|none|
|description|string|false|none|none|
|format|string|false|none|none|
|name|string|false|none|none|
|os_arch|string|false|none|none|
|os_detail|string|false|none|none|
|os_type|string|false|none|none|
|shared|integer(int64)|false|none|none|

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
|description|string|false|none|none|
|name|string|false|none|none|

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
|description|string|false|none|none|
|name|string|false|none|none|

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
|description|string|false|none|none|
|name|string|false|none|none|

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
|description|string|false|none|none|
|name|string|false|none|none|

