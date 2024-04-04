---
title: 2.3 安装ChimeStack
date: 2023-11-09
description: 本章对介绍如何安装ChimeStack
weight: 4
---

## 2.3.1 通过ISO安装ChimeStack 

## 2.3.2 手动安装ChimeStack 

### 安装Chime-Stack包 

Chime-Stack的二进制安装包可从 [Downloads/Releases](https://chimestack.io/downloads/releases) 下载

{{% alert title="提示" color="primary" %}}
目前chime-stack安装包仅在centos7/8/9上测试通过
{{% /alert %}}

在命令行直接运行，可完成安装

```
sudo ./chimestack-x.x.x.bin 
```

- 二进制程序chime-server, chime-agent和chimeadm安装在/usr/bin/
- server和agent的配置文件在/etc/chime/
- 进程相关文件在/var/lib/chime/
- 日志文件在/var/log/chime/ 
  
如果系统中已经安装了chime-stack，执行安装命令后，除了二进制程序会被更新外，/etc/chime、/var/lib/chime和/var/lib/log下的所有文件均不会被更新，如果要强制更新，运行:

```
sudo ./chimestack-x.x.x.bin --force 
```

### 安装第三方组件

chime-stack(或)依赖以下第三方程序: 
- (必须)mysql: 存储chime-server的元数据信息
- (必须)influxdb: 存储chime-server运行时的全部监控数据
- (可选) s3协议的对象存储程序，如minio: 提供镜像服务的存储引擎，由于chime-server内部集成了一个s3引擎，所以当缺少第三方s3服务时，可以选择用chime-server的s3引擎作为镜像服务的存储。 

#### 1.安装mysql 

推荐安装mysql7.0以上版本

##### 公网可达的安装方式

```
sudo yum install mysql-server 
```
或
```
sudo dnf install mysql-server 
```

{{% alert title="提示" color="primary" %}}
如果当前系统已经安装了旧版本的mysql服务，需要先卸载旧的mysql: 
```
sudo yum remove mysql-server
```

并且需要把 /var/lib/mysql文件夹清空。否则新的mysql可能会出现innodb配置错误

{{% /alert %}}

##### 不需要公网的安装方式

mysql8.x的离线安装包可以从 [官方下载](https://dev.mysql.com/downloads/mysql/) 或者从 [Downloads/3rd/Mysql](https://chimestack.io/downloads/3rd/mysql) 获取。

安装所需的rpm及其顺序如下：
1. mysql-community-common-8.0.36-1.el8.x86_64.rpm
2. mysql-community-icu-data-files-8.0.36-1.el8.x86_64.rpm
3. mysql-community-client-plugins-8.0.36-1.el8.x86_64.rpm
4. mysql-community-libs-8.0.36-1.el8.x86_64.rpm
5. mysql-community-client-8.0.36-1.el8.x86_64.rpm
6. mysql-community-server-8.0.36-1.el8.x86_64.rpm

分别运行如下命令安装rpm包:

```
sudo rpm -ivh mysql-xxx.rpm 
```

##### 启动mysql

```
sudo systemctl enable mysqld 
sudo systemctl start mysqld 
```


#### 2.安装influxdb 

ChimeStack要求influxdb 2.x版本

可从官网下载 [官方下载]（https://docs.influxdata.com/influxdb/v2/install/）influxdb官方安装包，例如:

```
curl -O https://dl.influxdata.com/influxdb/releases/influxdb2-2.7.5-1.x86_64.rpm
```

或者从ChimeStack网站[Downloads/3rd/Influxdb](https://chimestack.io/downloads/3rd/influxdb) 下载influxdb 2.7.5安装包


下载后运行: 

```
sudo yum localinstall influxdb2-2.7.5-1.x86_64.rpm
sudo systemctl enable influxdb 
sudo systenctl start influxdb
```

如果需要influxdb客户端程序，可从[官方下载](https://docs.influxdata.com/influxdb/v2/tools/influx-cli/)客户端安装包，或者从ChimeStack网站[Downloads/3rd/Influxdb-CLI](https://chimestack.io/downloads/3rd/influxdb-cli) 下载influxdb2 客户端安装包

下载后安装客户端程序: 

```
sudo tar xvf influxdb2-client-2.7.3-linux-amd64.tar.gz
sudo cp influx /usr/bin/ 
```

### 安装第三方s3服务程序

ChimeStack可以对接任何支持s3协议的对象存储引擎，推荐安装minio，安装方法参考 [官方文档](https://min.io/docs/minio/linux/operations/installation.html)

### 安装qemu+libvirt

安装 libvirt, qemu, genisoimage 包

```
sudo dnf install qemu-kvm libvirt genisoimage 
```

或

```
sudo yum install qemu-kvm libvirt genisoimage 
```

{{% alert title="提示" color="primary" %}}
ChimeStack需要使用libvirt8.0, qemu6.0以上版本
{{% /alert %}}

然后启动libvirtd
```
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
```

### 安装chrony服务

{{% alert title="提示" color="primary" %}}
CentOS 8以后已经使用chrony替代ntp 
{{% /alert %}}

安装chrony 

```
sudo yum install -y chrony
```

配置chrony服务端

```
#sudo vim /etc/chrony.conf 
# Allow NTP client access from local network.
allow 192.168.0.0/16

```

配置chrony客户端

```
#sudo vim /etc/chrony.conf 
#config the chrony server's ip address as the chrony pool
pool 192.168.x.x iburst
```

在服务端和客户端分别启动chronyd服务

```
sudo systemctl enable chronyd 
sudo systemctl start chronyd
```

### 设置时区

```
#check current timezone setting
timedatectl 

#list avaialble timezones 
timedatectl list-timezones 

#set new timezone 
sudo timedatectl set Asia/Shanghai
```