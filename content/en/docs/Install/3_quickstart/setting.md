---
title: Configure ChimeStack
date: 2023-11-09
description: This chapter introduces how to configure and start ChimeStack
weight: 5
---

{{% alert title="Information" color="primary" %}}
If ChimeStack is installed with the AllInOne ISO image, so there is no other additional configuration needed. Please ignore this chapter.
{{% /alert %}}

## 1. Configure and Start chime-server/chime-portal

This section introduces how to configure the chime-server's indenpdent components including mysql, influxdb and OSS(s3), and how to launch a chime-server process.  

### 1.1 Configure and initiate mysql

##### Create new mysql user 

Login mysql with root user via client tool, create new user named "chime"，and grant privileges to user chime

```
CREATE USER 'chime'@'%' IDENTIFIED BY 'chime';
GRANT ALL PRIVILEGES ON *.* TO 'chime'@'%';
flush privileges;
```

##### Initiate database

Utilize the "chimeadm" command to initiate the mysql database and update the configuration of chime-server

```
chimeadm initserver mysql --ip <ip address> --port <port> --user <user> --password <password> --name <dbname>
```

The command's flags are explained as follows:
- ip address: mysql instance's ip address 
- port: mysql instance's port 
- user: user name to access mysql database  
- password: user's password 
- name: the database name to be initiated

For instance:

```
chimeadm initserver mysql --ip 127.0.0.1 \
  --port 3306 \
  --user chime \
  --password chime \
  --name chime 
```

If the command completes successfully, the "chime" database is created and initiated, and the mysql related settings in the configuration file of /etc/chime/server.yaml will be updated as well. 


### 1.2 Configure influxdb 

##### Initiate influxdb

**method #1**: initiate by the Web UI

Access "https://<influxdb service ip>:8086/" via a browser，input the user name/password, input the organization name and bucket name, and then it will generate an API token，which should be kept carefully, it is the only access token to Influxdb API.

**method #2**: initiate by influx CLI

for instance: 
```
influx setup \
  --username chime-user \
  --password passw0rd \
  --token x5iGbxLx-2QKN64I3wooyZsHPtmGB4OvBspdSLuOcEBeN-_-rrnC_1GbtSrJrUD0-qSiXsYrKC0T4VF4m97ecw== \
  --org chime \
  --bucket chime \
  --name chime \
  --force
```

**Note**: if not specify the "token" flag, then it will generate an API token instead, which should be kept carefully.

##### Configure influxdb setting of chime-server

The following command updates the influxdb's setting in the configuration of chime-server

```
chimeadm initserver influxdb --vip-endpoint <vip based endpoint> --real-endpoints <real service endpoints> --token <token> --org <org> --bucket <bucket>
```

The command's flags are explained as following: 
- vip-endpoint: if the influxdb is accessed through a VIP with load balancing provisioned by keepalived+lvs tools，the vip-endpoint should be set to the ingress endpoint of the load balancing instance; If the influxdb is accessed directly，vip-endpoint should be set to the endpoint of infludb instance.
- real-endpoints: influxdb instances' endpoints(use commas to separate multiple endpoints)
- token: API token to access influxdb
- org: organization name pre-set in the influxdb
- bucket: bucket name pre-set in the influxdb

For instance:

```
chimeadm initserver influxdb --vip-endpoint http://192.168.231.120:8086 \
  --real-endpoints http://192.168.231.121:8086,http://192.168.231.122:8086 \
  --token x5iGbxLx-2QKN64I3wooyZsHPtmGB4OvBspdSLuOcEBeN-_-rrnC_1GbtSrJrUD0-qSiXsYrKC0T4VF4m97ecw== \
  --org chime \
  --bucket chime
```

### 1.3 Configure S3 setting of chime-server

You can update the s3 setting in the configuration of chime-server by following command: 

```
chimeadm initserver s3 --ip <ip address> --port <port> --ak <ak> --sk <sk> --embedded --path [path to storage] 
```

The command's flags are explained as follows: 
- ip address: the IP address of S3 instance
- port: the access port of S3 instance
- ak: AK token of S3
- sk: SK token of S3
- embedded: to use an chime-server embedded s3 engine
- path: if the embedded flag is set，the directory for the S3 engine's storage
 
For instance:

```
# use embedded minio engine 
chimeadm initserver s3 --ip 192.168.231.100 --port 9000 --ak chime --sk chime --embedded --path /storage/s3

# use 3rd s3 service 
chimeadm initserver s3 --ip 192.168.231.101 --port 9000 --ak chime --sk chime
```

### 1.4 Check chime-server

You can invoke the "chimeadm initserver check" sub-command to check the correctness of the chime-server's configuration, it will check the availability of Mysql, Influxdb and S3 components by probing their connectivity and functions, for instance, run following command in the server node:

```
chimeadm initserver check 
```
The success of the checking means the configuration is complete and valid, the chime-server is ready to run


### 1.5 Configure and initiate the portal database 

You can initiate the portal database and update the configuration of chime-portal by the following command: 

```
chimeadm initportal mysql --ip <ip address> --port <port> --user <user> --password <password> --name <dbname>
```

The command's flags are explained as follows: 
- ip address: mysql instance's ip address 
- port: mysql instance's port
- user: user name to access mysql database  
- password: user's password
- name: the database name to be initiated

For instance:

```
chimeadm initportal mysql --ip 127.0.0.1 \
  --port 3306 \
  --user chime \
  --password chime \
  --name portal
```

If the command completes successfully, the "portal" database is created and initiated, and the mysql related settings in the configuration file of /etc/chime/server.yaml will be updated as well. 

### 1.6 Configure chime-portal's runtime parameters

Chime-portal performs its functions through the chime-server's APIs, the following command is used to configure the runtime parameters of chime-portal:


```
chimeadm initportal runtime --api-uri <server vip/ip:port> --bind-port <port>
```

The command's flags are explained as follows: 
- api-uri: chime-server's API endpoint, note that when chime-servers are deployed in multi-active mode, you need to use the VIP address of the service instead of the physical IP addresses.
- bind-port: chime-portal's service port, by default it is 8033. 

For instance:

```
chimeadm initportal runtime --api-uri 127.0.0.1:8801 --bind-port 8035 
```

### 1.7 Check chime-portal

You can invoke the "check" sub-command to check the correctness of the configuration of chime-portal, for instance:

```
chimeadm initportal check 
```

The success of the checking means the configuration is complete and valid, the chime-portal is ready to run


### 1.8 Run chime-server/chime-portal

The chime-server binary program includes both the server service (centerized management service) and the portal service (Web UI service). These two services can be either launched in one process, or launched in two seperate processes of the same server, or launched independently as processes of different servers.

When the chime-server program is about to function, which services to start is determined based on the setting of the environment variable "CHIME_SERVER_MODEL", for example: 
- CHIME_SERVER_MODEL=combined: it is the default setting，which means chime-server process will serve as both "server"  and "portal".
- CHIME_SERVER_MODEL=server: the chime-server process only serves as the centerized server.
- CHIME_SERVER_MODEL=portal: the chime-server process only serves as the portal server for Web UI.  

It is recommended to manage the chimestack service through the systemd framework of Linux. Users usually don't need to change the environment variables by themselves. Systemd will read the environment variables from specific environment file.

- For chime-server.service systemd service, it will load the /etc/default/chime-server environment file before start up the process，the "CHIME_SERVER_MODEL" variable is set to "combined" by default. 
- For chime-portal.service systemd service, it will load the /etc/default/chime-portal environment file before start up the process，the "CHIME_SERVER_MODEL" variable is set to "portal" by default. 

After the server and portal are configured and initiated, you can start the server and portal services, for example, to start them in the combined mode , just to start chime-server.service as following:

```
sudo systemctl start chime-server.service
```

To start the "server" and the "portal" services seperatedly，you can run them as following:

```
#change the CHIME_SERVER_MODEL=server in /etc/default/chime-server file
sudo systemctl start chime-server.service
sudo systemctl start chime-portal.service
```

Check their runtime status:

```
sudo systemctl status chime-server
# if launched the portal service 
sudo systemctl status chime-portal 
```

chime-server's runtime logs are located at /var/log/chime/server.log

chime-portal's runtime logs are located at /var/log/chime/portal.log

## 2. Configure and start chime-agent

### 2.1 Configure chime-agent

chime-agent is the client-side program of ChimeStack，normally runs in the computing nodes(actually there is no restriction for defining a server node and a computing node, they can share the same machine or be deployed separately). chime-agent reads the configurations from the /etc/chime/agent.yaml file during the startup, following introduces how to configure and start chime-agent via the "chimeadm" tool.

You can configure the chime-agent by the following command:

```
chimeadm initagent --host [host name] --manage-ip <manage ip address> --node-ip <node ip address>  --storage-ip <storage ip address>  --rack <rackname> --api <server ip:port> --token <token>
```


The command's flags are explained as follows: 
- host(optional): current hostname, chimeadm will generate a random hostname if omit this flag.
- manage-ip: current node's management network's IP address 
- node-ip: current node's business network's IP address 
- storage-ip: current node's storage network's IP address 
- rack: the rack name where the node is located
- api: the API endpoint of chime-server
- token: the API token of chime-server

For instance:

```
chimeadm initagent \
  --host chime-node1 \
  --manage-ip 192.168.231.158 \
  --node-ip 172.28.10.101 \
  --storage-ip 10.10.10.101 \
  --rack rack1 \
  --api 192.168.231.101:8801 \
  --token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVdWlkIjoiMGZhYjZkYTQtYmU4Zi00ZGJhLTlhYzgtMTlmNGZmNTE5ZjM0IiwiYXVkIjoiY2hpbWUiLCJleHAiOjE3MTE3OTc0OTYsImlhdCI6MTcxMTc5NzQ5NiwiaXNzIjoiY2hpbWUiLCJzdWIiOiJjaGltZSJ9.DpCskpkyEHodbxPbj061iLMw1n04ibjZQ8qj5o0lRTA
```

If the command finishes successfully，chime-agent will receive its components' settings from the chime-server and save them in the configuration of agent。


### 2.2 Start chime-agent

```
sudo systemctl start chime-agent 
```

check the chime-agent's running status: 

```
sudo systemctl status chime-agent 
```

chime-agent's runtime log locates at /var/log/chime/agent.log

If the chime-agent starts with no error, the node will be logged into the platform automatically, but so far it is still not related to any cluster, to make it a normal functioning computing node that can accommodate virtual machine instances on demand, you must register it to one of the cluster and set allocation ratios for the node, more details refer to the chapter of [Node Management](../../webui/platform/host/).