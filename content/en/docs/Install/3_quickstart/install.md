---
title: Install ChimeStack
date: 2023-11-09
description: this chapter introduces how to install the ChimeStack in Linux 
weight: 3
---

## Install ChimeStack with ISO packages

## Manually Install ChimeStack

### Install ChimeStack Packages

Download the ChimeStack's binary packages from [Downloads/Releases](https://chimestack.io/downloads/releases).

{{% alert title="Note" color="primary" %}}
Currently, the install package has only been tested on CentOS7/8/9
{{% /alert %}}

Directly run the executable binary package to install the ChimeStack(root privilege required): 

```
sudo ./chimestack-x.x.x.bin 
```

- The executable binaries files chime-server, chime-agent, chimecli and chimeadm will be installed at /usr/bin/
- The chime-server's and chime-agent's configuration files will be installed at /etc/chime/
- Necessary libraries and files for ChimeStack's runtime process locates at /var/lib/chime/
- Log files locates at /var/log/chime/ 

For the pre-existing ChimeStack's installation, the new package will only overwrite the executable binaries, while the configuration files in /etc/chime, library files in /var/lib/chime and logs in /var/log/chime will not be updated. 
If you want to force it to update all the pre-existing files, please run it with a "force" flag, like:

```
sudo ./chimestack-x.x.x.bin --force 
```

### Install the 3rd softwares

Following 3rd softwares are dependent on ChimeStack : 
- (Required) Mysql provides storage and querying the meta data of ChimeStack
- (Required) Influxdb provides storage and querying the minitoring data of ChimeStack
- (Optional) Object storage service(OSS) software follows the S3 protocal, like minio, provides the storage engine for ChimeStack's image service and backup service。 

#### 1.Install Mysql

Mysql 7 and later versions are recommended

##### Installation with Internet

```
sudo yum install mysql-server 
```
或
```
sudo dnf install mysql-server 
```

{{% alert title="Note" color="primary" %}}
Please uninstall the pre-exsiting old version Mysql if any
```
sudo yum remove mysql-server
```

And please empty the /var/lib/mysql directory, otherwise there could be innodb configuration issues in the runtime

{{% /alert %}}

##### Installation with Packages

The installation package of mysql8.x can be downloaded from [Offical Website Download](https://dev.mysql.com/downloads/mysql/) or from [Downloads/3rd/Mysql](https://chimestack.io/downloads/3rd/mysql)

Please install the RPM packages in the following sequence：
1. mysql-community-common-8.0.36-1.el8.x86_64.rpm
2. mysql-community-icu-data-files-8.0.36-1.el8.x86_64.rpm
3. mysql-community-client-plugins-8.0.36-1.el8.x86_64.rpm
4. mysql-community-libs-8.0.36-1.el8.x86_64.rpm
5. mysql-community-client-8.0.36-1.el8.x86_64.rpm
6. mysql-community-server-8.0.36-1.el8.x86_64.rpm

For instance, invoke the following command to install a RPM package

```
sudo rpm -ivh mysql-xxx.rpm 
```

##### Start Mysql

```
sudo systemctl enable mysqld 
sudo systemctl start mysqld 
```


#### 2.Install Influxdb 

ChimeStack requires influxdb 2.x version or later, do **not** use influxdb 1.x versions.

Influxdb installation packages can be downloaded from [Offical Website Download](https://docs.influxdata.com/influxdb/v2/install/), such as:

```
curl -O https://dl.influxdata.com/influxdb/releases/influxdb2-2.7.5-1.x86_64.rpm
```

or download the influxdb 2.7.5 package from the ChimeStack web site [Downloads/3rd/Influxdb](https://chimestack.io/downloads/3rd/influxdb).

Run the following commands after downloading: 

```
sudo yum localinstall influxdb2-2.7.5-1.x86_64.rpm
sudo systemctl enable influxdb 
sudo systemctl start influxdb
```

If you want to install the client command line tool of influxdb，you can download its package from [Offical Website Download](https://docs.influxdata.com/influxdb/v2/tools/influx-cli/)，or from the ChimeStack Website[Downloads/3rd/Influxdb-CLI](https://chimestack.io/downloads/3rd/influxdb-cli)

Run the following commands after downloading: 

```
sudo tar xvf influxdb2-client-2.7.3-linux-amd64.tar.gz
sudo cp influx /usr/bin/ 
```

### Install 3rd OSS Service(s3)

ChimeStack supports any OSS provider which follows S3 protocal, such as Minio, which is also recommended by ChimeStack. You can refer to [MinIO Offcial Documentation](https://min.io/docs/minio/linux/operations/installation.html) for more details about its installation and configuration.

### Install qemu+libvirt

Install libvirt, qemu, genisoimage

```
sudo dnf install qemu-kvm libvirt genisoimage 
```

Or

```
sudo yum install qemu-kvm libvirt genisoimage 
```

{{% alert title="Note" color="primary" %}}
ChimeStack requires libvirt8.0, qemu6.0 or later versions
{{% /alert %}}

Start libvirtd
```
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
```

### Install Chrony Service

{{% alert title="Note" color="primary" %}}
From CentOS 8, it uses chrony service instead of ntp service by default
{{% /alert %}}

Install chrony 

```
sudo yum install -y chrony
```

Configure a chrony server

```
#sudo vim /etc/chrony.conf 
# Allow NTP client access from local network.
allow 192.168.0.0/16

```

Configure chrony clients:

```
#sudo vim /etc/chrony.conf 
#config the chrony server's ip address as the chrony pool
pool 192.168.x.x iburst
```

Start the chronyd service in both server and client sides respectively 

```
sudo systemctl enable chronyd 
sudo systemctl start chronyd
```

### Setup Timezone

```
#check current timezone setting
timedatectl 

#list avaialble timezones 
timedatectl list-timezones 

#set new timezone 
sudo timedatectl set-timezone Asia/Shanghai
```