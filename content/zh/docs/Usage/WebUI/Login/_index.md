---
title: 3.1 系统登录
date: 2023-11-09
weight: 3
description: 本章节介绍系统登录和设置用户个人信息
---

## ChimeStack用户的三层角色介绍

| Role                | 说明                               | 权限 |
|---------------------|------------------------------------|------|
| Super Administator  | 超级管理员角色,唯一账号 —— admin       | 云平台管理、其他用户管理、云资源生命周期管理 |
| Administator        | 管理员,可由超级管理员创建管理           | 云平台管理、普通用户管理 |
| User                | 普通用户,可由超级管理员或管理员创建管理  | 云资源的生命周期管理 |

## 登录系统

打开浏览器，输入 http://\<your-chime-server-vip-address\>:8033/，打开系统登录页面

{{% imgproc login Fit "800x600" %}}
{{% /imgproc %}}

输入用户名和密码若正确则完成登录

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



