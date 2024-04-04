---
title: 2.4 配置ChimeStack
date: 2023-11-09
description: 本章对介绍如何快速配置ChimeStack
weight: 5
---


## 初始化chime-server

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

运行成功后，mysql数据库chime被成功初始化，同时/etc/chime/server.yaml中的数据库配置信息会被更新。


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
chimeadm initserver influxdb --ip <ip address> --port <port> --token <token> --org <org> --bucket <bucket>
```

命令行参数解释如下: 
- ip address: influxdb实例的访问地址
- port: influxdb实例的访问端口
- token: influxdb实例的API访问令牌
- org: influxdb的组织名称
- bucket: influxdb的bucket名称
- 

例如:

```
chimeadm initserver influxdb --ip 127.0.0.1 \
  --port 8086 \
  --token x5iGbxLx-2QKN64I3wooyZsHPtmGB4OvBspdSLuOcEBeN-_-rrnC_1GbtSrJrUD0-qSiXsYrKC0T4VF4m97ecw== \
  --org chime \
  --bucket chime \
```