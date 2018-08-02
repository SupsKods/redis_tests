#!/bin/bash
mkdir /opt/redis
mkdir /opt/redis/bin
cd /opt/redis

wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
sudo make install


cp src/redis-server /opt/redis/bin/redis-server
cp src/redis-cli /opt/redis/bin/redis-cli

#configure redis db
cp /vagrant/redis.init.d /etc/init.d/redis
cp /vagrant/redis.conf /etc/redis.conf

mkdir /var/redis
chmod -R 777 /var/redis

useradd redis

chmod 755 /etc/init.d/redis
/etc/init.d/redis start

#configure redis clusters, ports starting over 7000
for i in $(seq 1 2); do
  sudo cp /vagrant/redis-cluster.init.conf /etc/init/redis-cluster.conf
  sudo cp /vagrant/redis-cluster.conf /etc/redis-cluster-$i.conf
  PORT=$[i+7000]
  sudo sed -i "s/port 7000/port $PORT/g" /etc/redis-cluster-$i.conf
  sudo service redis-cluster-$i start
done