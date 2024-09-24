---
title: 安装ChimeStack
date: 2023-11-09
description: 本章介绍如何安装ChimeStack在AllInOne环境
weight: 3
---

## 1. 通过ISO安装ChimeStack 

从[Download/Releases](http://download.chimestack.cloud/releases)下载ChimeStack的AllInOne ISO镜像安装盘，刻录成光盘或者拷贝U盘进行安装。在虚拟化环境中，可以直接以安装虚拟机的方式通过CDRom进行安装。


{{% alert title="提示" color="primary" %}}
注意: 需要启用VT-x和IOMMU支持，且系统需要配置2个网络接口
{{% /alert %}}

系统安装后，ChimeStack运行完整功能需要的组件(libvirt, mysql, influxdb和minio)已经装好。然后通过ssh登录系统，直接运行如下可执行程序:

```
/root/chime_allinone.bin
```

该程序将安装ChimeStack的二进制程序(chime-server, chime-agent, chimecli和chimeadm)，初始化数据库、配置文件和相关目录。

安装完成后，可直接启动ChimeStack: 

```
systemctl start chime-server
systemctl start chime-agent 
```

通过浏览器访问 'http://\<your IP address\>:8033/' 即可以直接使用

{{% alert title="提示" color="primary" %}}
初始超级管理员/密码为: admin/admin
{{% /alert %}}

**注意**: 用ISO安装的ChimeStack，已经完成以下配置:
- 一个可用区(Default)
- 一个集群(Default)
- 一个节点(就是本机)
- 一个本地存储池，在/mnt/local目录
- 一个业务网络，使用网卡名称eth1
- 一个公有镜像桶
- 三个实例规格(已经关联到Default集群)
- 两个云盘规格(已经关联到Default集群)
- Admin账户一个默认的安全组，允许ssh(22端口)登录

另外，数据组件的安装路径在：
- mysql的数据文件在/var/lib/mysql
- influxdb的数据文件在/var/lib/influxdb
- minio的存储路径在/mnt/minio

如果需要更换存储磁盘，可以通过修改服务配置或者挂载新磁盘到以上路径的方式。

## 2. 手动安装ChimeStack 

### 2.1 安装ChimeStack包 

从 [Download/Releases](http://download.chimestack.cloud/releases) 下载ChimeStack的二进制安装包

{{% alert title="提示" color="primary" %}}
目前chime-stack安装包仅在centos7/8/9上测试通过
{{% /alert %}}

在命令行直接运行，可完成安装

```
sudo ./chimestack-x.x.x.bin 
```

- 二进制程序chime-server、chime-agent、chimeadm和chimecli安装在/usr/bin/
- server和agent的配置文件(server.yaml和agent.yaml)在/etc/chime/
- 进程运行时所需文件和目录在/var/lib/chime/
- 日志文件在/var/log/chime/
  
如果系统中已经安装了chime-stack，执行安装命令后，仅可执行程序会被更新(chime-server、chime-agent、chimeadm、chimecli)，但其它文件/etc/chime、/var/lib/chime和/var/lib/log下的所有文件均不会被更新，如果要强制更新，运行:

```
sudo ./chimestack-x.x.x.bin --force 
```

{{% alert title="提示" color="primary" %}}
注意：强制更新后，旧版本的配置文件、进程运行时文件以及日志文件会全部被覆盖
{{% /alert %}}

### 2.2 安装所需组件

chime-stack依赖以下第三方程序: 
- (必须)mysql: 元数据的存储
- (必须)influxdb: 监控数据的存储
- (可选)遵守s3协议的对象存储服务软件(如minio),作为镜像服务、备份服务的存储引擎 

#### 2.2.1 安装mysql 

推荐安装mysql7.0以上版本

##### 网络安装方式

```
sudo yum install mysql-server 
```

或

```
sudo dnf install mysql-server 
```

{{% alert title="提示" color="primary" %}}
如果当前系统已经安装了旧版本的mysql服务，最好先卸载旧的mysql: 
```
sudo yum remove mysql-server
```

并且把旧的/var/lib/mysql文件夹清空。否则新安装的mysql可能会出现innodb配置错误

{{% /alert %}}

##### 离线安装方式

mysql8.x的离线安装包可以从 [官方下载](https://dev.mysql.com/downloads/mysql/) 或者从 [Download/3rd/Mysql](http://download.chimestack.cloud/3rd/mysql) 获取。

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


#### 2.2.2.安装influxdb 

ChimeStack要求influxdb 2.x版本

可从官网下载 [官方下载]（https://docs.influxdata.com/influxdb/v2/install/）influxdb官方安装包:

```
curl -O https://dl.influxdata.com/influxdb/releases/influxdb2-2.7.5-1.x86_64.rpm
```

或者从ChimeStack网站[Download/3rd/Influxdb](http://download.chimestack.cloud/3rd/influxdb) 下载influxdb 2.7.5安装包

下载后运行: 

```
sudo yum localinstall influxdb2-2.7.5-1.x86_64.rpm
sudo systemctl enable influxdb 
sudo systemctl start influxdb
```

如果需要安装influxdb客户端程序，可从[官方下载](https://docs.influxdata.com/influxdb/v2/tools/influx-cli/)客户端安装包，或者从ChimeStack网站[Download/3rd/Influxdb-CLI](http://download.chimestack.cloud/3rd/influxdb-cli) 下载influxdb2 客户端安装包

下载后安装客户端程序: 

```
sudo tar xvf influxdb2-client-2.7.3-linux-amd64.tar.gz
sudo cp influx /usr/bin/ 
```

#### 2.2.3 安装第三方s3服务软件

ChimeStack可以对接任何支持s3协议的对象存储引擎，推荐使用minio，minio的部署配置方法参考 [官方文档](https://min.io/docs/minio/linux/operations/installation.html)

### 2.3 安装qemu+libvirt

网络安装 libvirt, qemu, genisoimage

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

启动libvirtd
```
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
```

### 2.4 安装chrony服务

{{% alert title="提示" color="primary" %}}
推荐使用chrony，CentOS 8以后的版本已经用chrony替代ntp 
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

### 2.5 设置时区

```
#check current timezone setting
timedatectl 

#list avaialble timezones 
timedatectl list-timezones 

#set new timezone 
sudo timedatectl set-timezone Asia/Shanghai
```