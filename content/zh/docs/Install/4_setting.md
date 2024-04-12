---
title: 2.4 配置ChimeStack
date: 2023-11-09
description: 本章介绍如何快速配置并启动ChimeStack
weight: 5
---


## 配置并启动chime-server

本章节说明如何配置chime-server依赖的mysql,influxdb和s3组件，及如何启动chime-server

### 配置和初始化mysql

##### 创建mysql新账户

通过mysql客户端登录mysql, 创建新账户chime，并给chime用户赋予数据库权限

```
CREATE USER 'chime'@'%' IDENTIFIED BY 'chime';
GRANT ALL PRIVILEGES ON *.* TO 'chime'@'%';
flush privileges;
```

##### 初始化并配置数据库

通过以下命令初始化数据库并更新chime-server配置

```
chimeadm initserver mysql --ip <ip address> --port <port> --user <user> --password <password> --name <dbname>
```

命令行参数解释如下: 
- ip address: mysql实例的访问地址
- port: mysql实例的访问端口
- user: mysql访问用户名称
- password: mysql访问用户密码
- name: 要初始化的数据库名称

例如:

```
chimeadm initserver mysql --ip 127.0.0.1 \
  --port 3306 \
  --user chime \
  --password chime \
  --name chime 
```

运行成功后，数据库chime被成功初始化，同时/etc/chime/server.yaml中的数据库配置信息会被更新。


### 配置influxdb 

##### 初始化influxdb

**方式一**: 通过登录web ui配置

访问 "https://<influxdb service ip>:8086/"，输入用户名/密码，输入organization name和bucket name后，生成api-token，api-token需要被妥善保存，后续作为Influxdb API的访问凭证。

**方式二**: 通过influx cli完成初始化

```
influx setup \
  --username chime-user \
  --password passw0rd \
  --token x5iGbxLx-2QKN64I3wooyZsHPtmGB4OvBspdSLuOcEBeN-_-rrnC_1GbtSrJrUD0-qSiXsYrKC0T4VF4m97ecw== \
  --org chime \
  --bucket chime \
  --force
  --name chime
```

其中如果token选项为空的话，会自动生成一个api-token，api-token需要被妥善保存，后续作为Influxdb API的访问凭证。

##### 配置influxdb

通过以下命令更新chime-server配置

```
chimeadm initserver influxdb --vip <virtual ip address> --rips <real ip addresses> --port <port> --token <token> --org <org> --bucket <bucket>
```

命令行参数解释如下: 
- vip-endpoint: 通过virtual IP访问地址(可以是keepalived的VIP地址，也可以是实际的物理地址)
- real-endpoints: influxdb运行实例的物理endpoint地址
- token: influxdb实例的API访问令牌
- org: influxdb的组织名称
- bucket: influxdb的bucket名称
- 

例如:

```
chimeadm initserver influxdb --vip-endpoint 192.168.231.163 \
  --real-endpoints http://192.168.231.128:8086,http://192.168.231.158:8086
  --token x5iGbxLx-2QKN64I3wooyZsHPtmGB4OvBspdSLuOcEBeN-_-rrnC_1GbtSrJrUD0-qSiXsYrKC0T4VF4m97ecw== \
  --org chime \
  --bucket chime \
```

### 配置s3

通过以下命令更新chime-server配置

```
chimeadm initserver s3 --ip <ip address> --port <port> --ak <ak> --sk <sk> --embedded --path [path to storage] 
```

命令行参数解释如下: 
- ip address: s3实例的访问地址
- port: s3实例的访问端口
- ak: s3的ak凭证
- sk: s3的sk凭证
- embedded: 启用内置的s3单路径存储引擎
- path: 当embedded设置时，s3存储的路径
 
例如:
```
chimeadm initserver s3 --ip 192.168.231.128 --port 9000 --ak chime --sk chime --embedded --path /storage/s3
```

### 检查chime-server

chimeadm提供check命令检查chime-server的配置, 并且检查mysql, influxdb和s3等依赖组件的可用性, 在server节点运行:

```
chimeadm initserver check 
```

如果检查成功，则chime-server可以直接启动

### 运行chime-server

在server节点直接运行:

```
chime-server
```

即可启动管控服务进程，日志输出在/var/log/chime/server.log

## 配置并启动chime-portal 

chime-server程序除了包含了ChimeStack的管控服务端程序，还内嵌了一个Web UI程序(portal), Web UI可以独立于Server进程单独运行，也可以和Server运行在一个进程中，默认是运行在同一个进程中。

下面介绍如何配置和初始化chime-portal，以及如何运行chime-portal

### 配置和初始化portal数据库

通过以下命令初始化portal数据库并更新chime-portal配置

```
chimeadm initportal mysql --ip <ip address> --port <port> --user <user> --password <password> --name <dbname>
```

命令行参数解释如下: 
- ip address: mysql实例的访问地址
- port: mysql实例的访问端口
- user: mysql访问用户名称
- password: mysql访问用户密码
- name: 要初始化的数据库名称

例如:

```
chimeadm initportal mysql --ip 127.0.0.1 \
  --port 3306 \
  --user chime \
  --password chime \
  --name portal
```

运行成功后，数据库portal被成功初始化，同时/etc/chime/server.yaml中的数据库配置信息会被更新。

### 配置portal运行参数

通过以下命令配置portal运行参数

```
chimeadm initportal run --port <port> --api-url <api server addr: port> --prefix [prefix] 
```


命令行参数解释如下: 
- port: chime-portal的访问端口
- api-url: chime-server的api访问地址
- prefix: chime-server的api的访问版本, 默认为 "/v1"

例如:

```
chimeadm initportal run \
  --port 8033 \
  --api-url 192.168.231.128:8801 \
  --prefix /v1
```

### 检查chime-portal

运行
```
chimeadm initportal check 
```
检查chime-portal的配置，如果检查成功，则chime-portal可以直接启动

### 运行chime-portal

默认chime-server和chime-portal是在同一个进程中启动的，server和portal的配置都在文件/etc/chime/server.yaml中，该配置文件的默认格式为: 
```
chime-server:
    ......
    ......
chime-portal: 
    ......
    ......
```

server和portal配置完成后，运行chime-server会同时启动server和portal

如果需要分别运行server和portal，可以将 /etc/chime/server.yaml中 [chime-portal]的部分拷贝到新文件, 例如/etc/chime/portal.yaml, 原来的配置文件仅保存[chime-server]部分。这样server和portal可以分别运行: 

```
chime-server #仅运行server
chime-server --cfg /etc/chime/portal.yaml #仅运行portal 
```

## 配置并启动chime-agent

### 配置chime-agent

chime-agent是ChimeStack的客户端程序，运行在计算节点上(也可以和chime-server在同一节点上)。chime-agent启动时会读取agent的配置文件(/etc/chime/agent.yaml)，下面介绍如何通过chimeadm配置并启动agent

通过以下命令配置agent运行参数

```
chimeadm initagent --host [host name] --ip <ip address> --rack <rackname> --api <server ip:port> --token <token>
```


命令行参数解释如下: 
- host(可选): 当前host的名称
- ip: 当前节点的管理网ip
- rack: 当前节点所在机架的名称
- api: chime-server api服务的uri
- token: chime-server的认证token

例如:

```
chimeadm initagent
  --host chime-node1 \
  --ip 192.168.231.158 \
  --rack rack1 
  --api 192.168.231.128:8801 \
  --token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVdWlkIjoiMGZhYjZkYTQtYmU4Zi00ZGJhLTlhYzgtMTlmNGZmNTE5ZjM0IiwiYXVkIjoiY2hpbWUiLCJleHAiOjE3MTE3OTc0OTYsImlhdCI6MTcxMTc5NzQ5NiwiaXNzIjoiY2hpbWUiLCJzdWIiOiJjaGltZSJ9.DpCskpkyEHodbxPbj061iLMw1n04ibjZQ8qj5o0lRTA
```

配置成功后，chime-server会自动下发配置给chime-agent完成其它组件访问的设置。

### 检查chime-agent

运行

```
chimeadm initagent check 
```

检查chime-agent的配置，以及和chime-server的联通性，成功后chime-agent即可直接运行

### 运行chime-agent

在计算节点直接运行:

```
chime-agent
```

运行时日志信息在/var/log/chime/agent.log

运行后，节点会自动注册到系统中，但是没有分配给具体的Cluster以及设置超分比等信息，需要在Web UI或者CLI手动添加到集群中，具体参考[节点管理](../../webui/platform/host/) 章节。