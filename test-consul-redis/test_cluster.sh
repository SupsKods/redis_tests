#!/bin/bash

#out of consul members
#Node     Address             Status  Type    Build  Protocol
#consulredis3  172.20.20.30:8301  alive   server  0.3.0  2
#consulredis2  172.20.20.20:8301  alive   server  0.3.0  2
#consulredis1  172.20.20.10:8301  alive   server  0.3.0  2

out="$(sudo consul members | grep -o alive | wc -l)"
expected_servers=3
if [ "$out" == "$expected_servers" ]
then
	echo "CONSUL CLUSTER is ALIVE with 3 nodes"
else
	echo "Some nodes in CONSUL CLUSTER are not ALIVE"
fi



sudo /usr/local/bin/redis-cli -h 172.20.20.10 -p 7001
#I would have to do some more research on how to SET/GET
# values from redis cluster after running redis-cli through scripts

#sample test
#redis-cli -c -p 7000
#redis 127.0.0.1:7000> set foo bar
#-> Redirected to slot [12182] located at 127.0.0.1:7002
#OK
#redis 127.0.0.1:7002> set hello world
#-> Redirected to slot [866] located at 127.0.0.1:7000
#OK
#redis 127.0.0.1:7000> get foo

# we can test redis by quering consul for services
#curl 127.0.0.1:7000/v1/catalog/services | grep "redis"