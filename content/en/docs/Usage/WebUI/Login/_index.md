---
title: 3.1 Login
date: 2023-11-09
weight: 3
description: This chapter introduces how to login the ChimeStack and how to update personal information
---

## System Login

Access the url of "http://\<your-chime-server-vip-address\>:8033/" in browser, open the login page.

{{% imgproc login Fit "800x600" %}}
{{% /imgproc %}}

Input username and password to login

{{% pageinfo color="primary" %}}
The initial username/password of the super administrator is: admin/admin
{{% /pageinfo %}}

{{% alert title="Note" color="primary" %}}
User passwords in ChimeStack are stored with double encryption
{{% /alert %}}

## Update personal information including password 

Click user's avator on the top-right of the main page, such as: 

{{% imgproc userpanel Fit "240x240" %}}
{{% /imgproc %}}

Click the **Setting** button，enter the user's information edit page, such as:

{{% imgproc usersetting Fit "600x600" %}}
{{% /imgproc %}}

You can update the user's password, avator, login name and nickname in the page. 

## User session's limitation

By default, each account can have 2 sessions. The latest session will kick out the oldest session if the number of sessions exceeds the limitation. You can change the number of session limitations by modifying the chime-server's configuration file. Such as editing the /etc/chime/server.yaml file as follows:

```
chime-server:
  #the number of user sessions:
  user_sessions: 2
  ...
```

Then restart the chime-server to have the change take into effect:

```
systemctl restart chime-server 
```