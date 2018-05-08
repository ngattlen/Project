#filename: vagrant-prov.sh
#!/usr/bin/env bash

# Updates, Apache, Firewall und MySQL installieren
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install apache2 -y
debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'
sudo apt-get install mysql-server -y
sudo apt-get install ufw
    sudo ufw status
    sudo ufw -f enable  
    sudo apt-get install libapache2-mod-proxy-html
sudo apt-get install libxml2-dev -y
sudo a2enmod proxy
sudo a2enmod proxy_html
sudo a2enmod proxy_http
sudo service apache2 restart -y

# Port 80 (HTTP) öffnen für alle
sudo ufw allow 80/tcp
sudo ufw -f enable
exit

# Port 22 (SSH) nur für den Host (wo die VM laufen) öffnen
sudo ufw allow from 10.0.2.15 to any port 22
exit

# Port 3306 (MySQL) nur für den web Server öffnen
vagrant ssh database
sudo ufw allow from any to any port 3306
exit