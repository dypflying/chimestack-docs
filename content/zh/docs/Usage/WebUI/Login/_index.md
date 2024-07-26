---
title: 3.1 系统登录
date: 2023-11-09
weight: 3
description: 本章节介绍系统登录和设置用户个人信息
---

## 登录系统

打开浏览器，输入 "http://\<虚拟IP管控服务地址\>:8033/"，打开系统登录页面。若您没有使用虚拟IP地址，比如在AllInOne环境，即是管控进程chime-server所在的管理网地址。

{{% imgproc login Fit "800x600" %}}
{{% /imgproc %}}

输入用户名和密码，若正确则完成登录

{{% pageinfo color="primary" %}}
超级管理员的初始用户名/密码为: admin/admin
{{% /pageinfo %}}

{{% alert title="提示" color="primary" %}}
所有用户密码均经过二次加密存储
{{% /alert %}}

## 修改用户个人信息、密码

点击屏幕右上角的头像

{{% imgproc userpanel Fit "240x240" %}}
{{% /imgproc %}}

然后点击**设置**按钮，进入用户信息修改页面，如下所示：

{{% imgproc usersetting Fit "600x600" %}}
{{% /imgproc %}}

用户自己可以修改密码、头像、名称等信息。

## 用户Session限制

默认每个账户可以在两个不同设备(浏览器)登录，即每个用户最多可以拥有两个session，新登录的session会踢出最久登录的session使其登录失效。您可以通过修改chime-server的配置文件，来改变用户可同时登录session的个数。编辑 /etc/chime/server.yaml文件如下: 

```
chime-server:
  #用户session个数
  user_sessions: 2
  ...
```

然后重新启动chime-server使配置生效:

```
systemctl restart chime-server 
```



