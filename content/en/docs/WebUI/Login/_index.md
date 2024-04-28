---
title: 3.1 Login
date: 2023-11-09
weight: 3
description: This chapter introduces how to login the ChimeStack and how to update personal information
---

## 3 User Roles in ChimeStack

| Role                | Description      | Privilege |
|---------------------|------------------------------------|------|
| Super Administator  | super administator, "admin" is the only super administator | platform management, user management, cloud resources management |
| Administator        | administator, created by super administator or administators | platform management、user management |
| User                | normal user, created by super administator or administators  | cloud resources management |

## System Login

Access the url of "http://\<your-chime-server-vip-address\>:8033/" in browser, open the login page.

{{% imgproc login Fit "800x600" %}}
{{% /imgproc %}}

Input username and password to login

{{% pageinfo color="primary" %}}
the initial username/password of the super administrator is "admin/admin"
{{% /pageinfo %}}

{{% alert title="Note" color="primary" %}}
user passwords in ChimeStack are double encrypted and stored
{{% /alert %}}

## Update personal information including password 

点击屏幕右上角的头像
Click user's avator on the top-right of the main page, for instance: 

{{% imgproc userpanel Fit "240x240" %}}
{{% /imgproc %}}

Click the **Setting** button，enter the user's information edit page, for instance:

{{% imgproc usersetting Fit "600x600" %}}
{{% /imgproc %}}

User's password, avator login name and nickname can be updated in the page. 