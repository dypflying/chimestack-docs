---
title: User Image
description: user images' management in ChimeStack
weight: 3
---

## Check User Images

* Check user's image list：
  * Click "**Filter**" button, input or select filter conditions, check the filtered image list
  * Click "**Columns**" button，select the columns to be displayed in the list，by default it shows all columns
* Update user's image：
  * Click "**Edit**" button to edit image's attributes
* Delete user's image 
  * Click "**Delete**" button to delete an image
  
{{% imgproc image_list Fit "1000x500" %}}
User's image list page
{{% /imgproc %}}

{{% alert title="Note" color="default" %}}
A user's image is availale for all clusters, but only the owner can access except for it is marked as a shared image
{{% /alert %}}


## Add user's image

* To create an image，input or choose the following image's attributes: 
  * Input the image's name, which is restricted to 2～64 characters and only allows alphbet, number, “-” and “_”.
  * Choose the file format of the image from the dropdown menu, which contains "raw", "qcow2" and "iso" file format
  * Choose the operation system's type from the dropdown menu. 
  * Choose the operation system's version.
  * (Optional) Choose the system's architecture
  * (Optional) Choose the boot type of the image, such as "bios" or "uefi"
  * Choose sharable or not, by default it is not sharable. 
  * Input the install URL, it supports local uploading or sftp uploading。for a local uploading url, its format like: file:///path, and for a sftp uploading url, its format like: sftp://username:password@host:/path. and as an alternative method, user can also upload the image file through the web browser directly in this page.

{{% imgproc create_image Fit "1000x1000" %}}
Create user's image page
{{% /imgproc %}}