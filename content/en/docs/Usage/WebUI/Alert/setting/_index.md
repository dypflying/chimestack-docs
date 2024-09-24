---
title: Alert's Setting
description: 
weight: 5
---

{{% alert title="Information" color="primary" %}}
Only administrators have the privilege to change the setting.
{{% /alert %}}

## Alert Email Notification Setting 

Receiver can receive the alert email notification after the email notification setting is taken into effect. 

* Input or choose:
  * SMTP email service address. 
  * Port number of the email service (generally used ports includes 25, 465 and 587)
  * Sender's email account(requires a valid account in the above email service)
  * Sender's email account password.
  
{{% imgproc alert_setting Fit "1000x400" %}}
alert notification setting
{{% /imgproc %}}

## Script Hook

In addition to the email notification, the administrator can also compose and set up a script hook to send other forms of notifications, such as text messages or voice calls, etc.

There is an example script hook under the installation directory of the server node of the ChimeStack(/var/lib/chime/server/alert/script_hook.sh), whose content is as following: 


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

There are 3 parameters required by the scripts: 
* #1. Receivers' list, receivers are seperated by commas, and each is encoded with base64 algorithm, you must decode each of them before using them. The raw text format of each receiver is as: \<name\>:\<phone number\>
* #2. Alert's title, encoded with base64 algorithm, decode it before using it.
* #3. Alert's content, encoded with base64 algorithm, decode it before using it.