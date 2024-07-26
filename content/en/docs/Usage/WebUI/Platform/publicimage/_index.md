---
title: Public Image Management
description: This chapter introduces how to manage public images in ChimeStack
weight: 10
---

## Check image buckets
  * Click "**Filter**" button, input or select filter conditions, check the filtered image bucket list. Each user has a dedicated image bucket.
  * Click "**Columns**" button，select the columns to be displayed in the list，by default it shows all columns

{{% imgproc bucket_list Fit "1000x600" %}}
image bucket list
{{% /imgproc %}}

## Check images
  * Click "**Filter**" button, input or select filter conditions, check the filtered image list. 
  * Click "**Columns**" button，select the columns to be displayed in the list，by default it shows all columns
  
{{% imgproc image_list Fit "1000x600" %}}
image list
{{% /imgproc %}}

## Add a public image
Input or choose the following information: 
  * Input the name of the image, which is restricted to 2～64 characters.
  * Choose the file format of the image from the dropdown menu, which contains "raw", "qcow2" and "iso" file format
  * Choose the operation system's type from the dropdown menu. 
  * Choose the operation system's version.
  * (Optional) Choose the system's architecture
  * (Optional) Choose the boot type of the image, such as "bios" or "uefi"
  * Input the install URL, it supports local uploading or sftp uploading。for a local uploading url, its format like: file:///path, and for a sftp uploading url, its format like: sftp://username:password@host:/path. and as an alternative method, user can also upload the image file through the web browser directly in this page.

  
{{% imgproc image_new Fit "1000x600" %}}
create new piblic image
{{% /imgproc %}}