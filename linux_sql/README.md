
# Introduction

The linux/SQL project is developed following the scrum methodolody. Primary scripts were developed using the "Bash" scripting language. It uses the bash script to 
create the docker container in order to set up a postgres psql instance. Two bash scripts, host_info.sh collects the hardware information and host_usage collects the
data regarding the maemory and cpu usage and monitors resource usage every minute using crontab. These scripts are use to add the dats into database using ddl.sql file.
These data can be used by the analyst to find out the potential oppertunities and challenges.

The repository is hosted on GitHub. The overall system is set up and running on Centos 7 Linux distribution virtual machine that is hosted by the Google Cloud 
Platform (GCP).

# Quick Start
 
- Start a psql instance using psql_docker.sh
./scripts/psql_docker.sh start|stop|create [db_username][db_password]

Aftter docker contaianer is installed and run in the host, psql_docker.sh is used to manage a PostgresSQL server container.

```Bash
./scripts/psql_docker.sh start 

./scripts/psql_docker.sh stop
```
- Create tables using ddl.sql

Database host_agent is created. host_usage and host_info table is created in the database using the ddl.sql file.
```Bash
psql -h localhost -U postgres -d host_agent -f sql/ddl.sql 
```
- Insert hardware specs data into the DB using host_info.sh
```Bash
./scripts/host_info.sh psql_host psql_port db_name psql_user psql_password
```
- Insert hardware usage data into the DB using host_usage.sh
```Bash
bash scripts/host_usage.sh psql_host psql_port db_name psql_user psql_password
```
- Crontab setup
```Bash
 bash /absolute_path_of_script/host_usage.sh localhost 5432 host_agent postgres password > /tmp/host_usage.log
```

# Implemenation

## Architecture
Every server has the host_info.sh and host_usage.sh script to insert the data into the database over the local network. Host server is responsible for the management of the database and tables through the `psql_docker.sh` and `ddl.sql` scripts. 
<img width="483" alt="architecture" src="https://user-images.githubusercontent.com/104375206/171737932-57758553-1e65-44c3-bcb6-87c4fdcca2eb.png">

## Scripts
- psql_docker.sh
Usage: ```Bash./psql_docker.sh start [user password]```

This script enable the user to control the docker container with postgress server and also enable to start and stop the docker.

- host_info.sh
Usage: ```Bash./scripts/host_info.sh psql_host psql_port db_name psql_user psql_password```

This script is used to collect the server hardware information and store it in the database. 

- host_usage.sh
Usage: ```Bash.scripts/host_usage.sh psql_host psql_port db_name psql_user psql_password```

This script collect the data regarding the memory and CPU usage. usage can be listed executing the vmstat and dt command.

- crontab
Usage: This script is used to schedule host_usage.sh to execute once every minute. 
following code is added to schedule host_usage.sh to execute once a minute once installed on the server:
```Bash
bash [server's local pathway]/host_usage.sh localhost 5432 host_agent postgres password > /tmp/host_usage.log
```
- queries.sql
    - Group hosts by CPU number and sort by their memory size in descending order.
    - Average used memory in percentage over 5 mins interval for each host.
    - Detect host failure


## Database Modeling

host_info table:

Column Name	            Data Type
id	                    PRIMARY KEY
hostname	              VARCHAR
cpu_number	            INTEGER
cpu_architecture	      VARCHAR
cpu_model	              VARCHAR
cpu_mhz	                VARCHAR
L2_cache	              INTEGER
total_mem	              INTEGER
timestamp	              TIMESTAMP

host_usage table:

Column Name	            Data Type
id	                    PRIMARY KEY
timestamp	              TIMESTAMP 
host_id	                INTEGER 
memory_free	            INTEGER
cpu_idle	              INTEGER
cpu_kernel	            INTEGER
disk_io	                INTEGER
disk_available	        INTEGER

# Test

The `psql_docker.sh` script was tested by verifying that the docker container was successfully created, started and stopped with the postgress server or not.

The `ddl.sql` script was tested by verifying that the database and tables are created in postgres server or not.

The `host_info.sh` and `host_usage.sh` scripts were tested by running them and insertion operation were tested adding some queries.

The `queries.sql` script was tested by insrting the data from through the Cluster Monitoring Agent and running the queries on it.

# Improvements
- Script to remove the server data of hardware usage of past.
- More SQL queries 


