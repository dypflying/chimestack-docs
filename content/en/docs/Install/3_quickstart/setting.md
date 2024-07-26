---
title: Configure ChimeStack
date: 2023-11-09
description: This chapter introduces how to configure and start ChimeStack
weight: 5
---

{{% alert title="Information" color="primary" %}}
If ChimeStack is installed with the AllInOne ISO image, so there is no other additional configuration needed. Please ignore this chapter.
{{% /alert %}}

## Configure and Start chime-server

This section introduces how to configure the chime-server's indenpdent components including mysql, influxdb and OSS(s3), and how to launch a chime-server process.  

### Configure and initiate mysql

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


### Configure influxdb 

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

### Configure S3 setting of chime-server

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

### Check chime-server

You can invoke the "chimeadm initserver check" sub-command to check the correctness of the chime-server's configuration, it will check the availability of Mysql, Influxdb and S3 components by probing their connectivity and functions, for instance, run following command in the server node:

```
chimeadm initserver check 
```
The success of the checking means the configuration is complete and valid, the chime-server is ready to run

### Launch chime-server
   
```
sudo systemctl start chime-server
```

Check the chime-server's status:

```
sudo systemctl status chime-server
```

chime-server's runtime log locates at /var/log/chime/server.log

## Configure and launch chime-portal 

The executable binary file of chime-server not only includes the management server，but also embeds a Web UI(portal) component, which is by default launched together with the management server，but it can also be launched as a standalone process.

Next section introduces how to configure, initiate and start a chime-portal process

### Configure and initiate the portal database 

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

### Configure chime-portal's runtime properties

You can invoke the following command to configure portal's runtime properties

```
chimeadm initportal run --port <port> --api-url <api server addr: port> --prefix [prefix] 
```


The command's flags are explained as follows: 
- port: chime-portal's access port 
- api-url: chime-server's API endpoint
- prefix: chime-server's API version in path, default is "/v1"

For instance:

```
chimeadm initportal run \
  --port 8033 \
  --api-url 192.168.231.101:8801 \
  --prefix /v1
```

### Check chime-portal

You can invoke the "check" sub-command to check the correctness of the configuration of chime-portal, for instance:

```
chimeadm initportal check 
```

The success of the checking means the configuration is complete and valid, the chime-portal is ready to run

### Start chime-portal

By default the chime-server and the chime-portal are launched in the same process，and their configurations are both in the file of /etc/chime/server.yaml，whose contents look like: 
```
chime-server:
    ......
    ......
chime-portal: 
    ......
    ......
```

With such configurations, launching a chime-server process will start a server routine and a portal routine simultaneously.

To run a chime-server and a chime-portal respectively is quite simple, just move the content of "[chime-server]" section from the server.yaml to the portal.yaml file, then you can launch the chime-server and the chime-portal respectively as following: 

```
sudo systemctl start chime-server #only launch server
sudo systemctl start chime-portal #only launch portal
```

## Configure and start chime-agent

### Configure chime-agent

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

### Check chime-agent

You can run the "check" sub-command to check the correctness of the chime-agent's configuration，and test the connectivity to chime-server.

```
chimeadm initagent check 
```

The success of the checking means the configuration is complete and valid，chime-agent is ready to run.

### Start chime-agent

```
sudo systemctl start chime-agent 
```

check the chime-agent's running status: 

```
sudo systemctl status chime-agent 
```

chime-agent's runtime log locates at /var/log/chime/agent.log

If the chime-agent starts with no error, the node will be logged into the platform automatically, but so far it is still not related to any cluster, to make it a normal functioning computing node that can accommodate virtual machine instances on demand, you must register it to one of the cluster and set allocation ratios for the node, more details refer to the chapter of [Node Management](../../webui/platform/host/).