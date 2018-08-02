#!/bin/bash
 #args-"/vagrant/nodex/config.json","/vagrant/node1/redis-cluster-x.init.conf","/vagrant/node1/redis-cluster-x.conf"
# Step 1 - Get the necessary utilities and install them.
sudo apt-get update
sudo apt-get install -y unzip curl wget
sudo apt-get install -y make gcc build-essential
sudo gem install redis
#sudo apt-get dist-upgrade -y
#apt-get install 
 
# Step 2 - Copy the init script to the /etc/init folder.
sudo cp /vagrant/consul.conf /etc/init/consul.conf
 
# Step 3 - Get the Consul Zip file and extract it.  
cd /usr/local/bin

wget https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip -nc
unzip *.zip
rm *.zip
 
# Step 4 - Make the Consul directory.
sudo mkdir -p /etc/consul.d
sudo chmod a+w /etc/consul.d
sudo mkdir /var/consul
 
# Step 5 - Copy the server configuration.
sudo cp $1 /etc/consul.d/config.json
 
# Step 6 - Start Consul
echo "******Sups -starting consul agent"
sudo consul agent -config-file=/etc/consul.d/config.json &
echo "******End -starting consul agent"

#redis installation
cd /usr/local/bin

wget http://download.redis.io/redis-stable.tar.gz
sudo tar xvzf redis-stable.tar.gz
cd redis-stable
sudo make
sudo make install

sudo cp src/redis-server /usr/local/bin/redis-server
sudo cp src/redis-cli /usr/local/bin/redis-cli
sudo cp src/redis-trib.rb /usr/local/bin/redis-trib.rb

sudo mkdir /var/redis
sudo chmod -R 777 /var/redis

sudo useradd redis

#init_file=$2
#conf_file=$3

# Configure redis db
#if echo $2 | grep -q "node1"; then
#	sudo cp $2 /etc/init/redis.conf
#	sudo cp $3 /etc/redis.conf
#	sudo service redis start

# configure redis sentinel
#sudo cp /vagrant/redis-sentinel.init.conf /etc/init/redis-sentinel.conf
#sudo cp /vagrant/redis-sentinel.conf /etc/redis-sentinel.conf
#sudo service redis-sentinel start
#else
	# Configure redis clusters
	#for i in $(seq 1 2); do
sudo cp $2 /etc/init/redis-cluster.conf
sudo cp $3 /etc/redis-cluster.conf
sudo /usr/local/bin/redis-server /etc/redis-cluster.conf &
#	done
#fi

