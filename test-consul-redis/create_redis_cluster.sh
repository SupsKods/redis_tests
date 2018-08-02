#!/bin/bash
#build__cluster
#consul has a bootstrap config and forms the cluster automatically
#3 redis servers need to be told to form cluster
# using the last VM to create cluster and test 
# bad idea to pass in hard coded IPs. Proper way is to pass in through a different variable files or ENV vars.

sudo /usr/local/bin/redis-trib.rb create 172.20.20.10:7001 172.20.20.10:7002 172.20.20.10:7003


