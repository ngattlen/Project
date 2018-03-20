#filename: vagrant-prov.sh
#!/usr/bin/env bash


sudo apt-get update
sudo apt-get upgrade
sudo apt-get install apache2 -y
echo "ServerName hello" > /etc/apache2/apache2.conf