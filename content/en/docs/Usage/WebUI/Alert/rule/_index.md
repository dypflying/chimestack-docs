---
title: Alert Rule Management 
description: 
weight: 3
---

* Check Alert Rule List 
  * Click "**filter**" button, input or select filter conditions, check the filtered alert rule list
  * Click "**columns**" button, select the columns to be displayed in the list，by default it shows all columns

{{% imgproc alert_rule Fit "1000x600" %}}
Alert rule list
{{% /imgproc %}}


## Create New Alert Rule
* Input or choose:
  * Input the name of the alert rule, which is restricted to 2～64 characters and only allows alphbet, number, “-”, “_” and space.
  * (Optional) Description.
  * Choose a Severity, there are 4 options including "information", "Warning", "Serious", "Smoking"
  * Choose a priority, there are 4 options including "Low", "Middle", "High", "Super High"
  * Choose a metrict object, there are 4 options for the monitoring objects, they are physical host(only privileged for adminitrators), instance, volume and network interface.
  * Choose a metrict item, whose options are updated according to the choosed "metrict object" option，such as the CPU average usage, memory average usage, network interface's I/O rate, storage's I/O rate, volumes's used capacity, etc. 
  * Input the value of the alert's threshold and choose its unit of the value, the possible metric's unit includes "percentage", "byte", "KiB", "MiB", "GiB"
  * Choose an aggregation time window of metrics data(that is to pickup a time value through the Web UI), all the metrics data are aggregated per the time windows, so that the alerts can be triggered if the calculated average value of the aggregated data is beyond its threshold value. 
  
{{% imgproc alert_rule_new Fit "1000x400" %}}
create new alert rule
{{% /imgproc %}}


## Alert Rule Management
* **Update**: Click the "Update" button to update an alert rule's information. 
* **Delete**: Click the "Delete" button to delete an alert information. 