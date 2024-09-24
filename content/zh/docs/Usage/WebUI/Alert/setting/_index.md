---
title: 报警设置
description: 
weight: 5
---

{{% alert title="提示" color="primary" %}}
只有管理员具备报警设置权限
{{% /alert %}}

## 报警邮件服务配置

只有正确地配置了报警邮件服务，报警接收者才能收到报警邮件。 

* 输入或选择:
  * 邮件服务(smtp)地址
  * 邮件服务器的端口(常用端口25、465或587)
  * 发送者邮箱账号(必须存在于上面配置的邮件服务器中)
  * 发送者邮箱账号密码
  
{{% imgproc alert_setting Fit "1000x400" %}}
报警设置
{{% /imgproc %}}

## 回调脚本

除了报警邮件，管理员还可以配置和编写回调脚本实现报警信息的发送，比如调用第三方接口发送短信、打电话等等。

回调脚本在ChimeStack的安装目录下有一个示例程序(/var/lib/chime/server/alert/script_hook.sh)，如下:


```
#!/bin/sh 

read PARAMS

TIME=`date +%s%N`
FILE="/var/log/chime/script_hook.log.$TIME"

#log original arguments
echo $PARAMS > $FILE
echo -e "\n" >> $FILE

#log receivers
PERSONS=`echo $PARAMS | cut -d ' ' -f1`
OLD_IFS="$IFS" 
IFS="," 
arr=($PERSONS) 
IFS="$OLD_IFS" 
for PERSON in ${arr[@]} 
do 
    echo "$PERSON" | base64 -d >> $FILE
    echo -e "\n" >> $FILE
done

#log title 
TITLE=`echo $PARAMS | cut -d ' ' -f2`
echo "$TITLE" | base64 -d >> $FILE
echo -e "\n" >> $FILE

#log description 
DESC=`echo $PARAMS | cut -d ' ' -f3`
echo "$DESC" | base64 -d >> $FILE
echo -e "\n" >> $FILE

exit 0 
```

回调脚本接收以下三个参数：
* 第一个参数为报警接收者列表,用逗号分隔，每个接收者都用base64加密，需要对他们分别解密到字符串，每个报警接收者的字符串的格式为 \<name\>:\<phone number\>
* 第二个参数为报警的标题，用base64加密，需要对其进行base64解密
* 第三个参数为报警的内容，用base64加密，需要对其进行base64解密

