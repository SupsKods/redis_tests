README

Files
-- Vagrantfile 
		This creates 3 VMS, installs consul and redis
		runs provision.sh file to do the installation
		runs create_redis_cluster.sh to do redis cluster creation
		runs test_cluster.sh to do basic smoke test_cluster
-- Provision.sh 
		installs consul, redis and starts services
-- create_redis_cluster.sh
		just creates redis cluster using redis-trib.rb tool provided with redis installation
-- test_cluster.sh
		does basic smoke test -
		'checks 'consul members' and uses redis-cli
-- nodex --> config files needed for each node
		
		
Setup
	just used 'SHELL' provisioning, so additional installation of tools is necessary
	install VirtualBox (due to some networking glitch - I had to force install virtualbox with old network NIC5 driver)
	install Vagrant
	Tested from windows laptop cygwin 

Test
	vagrant up

     
	