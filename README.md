# Project Modul 300
Hier wird alles dokumentiert.

# Vagrant
## Was ist Vagrant?
<p>Vagrant ist eine Software zum Verwalten von virtuellen Maschinen.</ps>

## Virtuelle Maschine über Vagrant erstellen
<p>Verzeichnis lokal auf dem PC erstellen und ein Vagrant File erstellen. Anschliessend Bash öffnen und folgende Befehle im Shell eingeben</br></p>

        mkdir ubuntu
        cd ubuntu
        vagrant init ubuntu/xenial64
        vagrant up --provider virtualbox

## Befehle für Vagrant

    vagrant up --> Startet die VM
    vagrant destroy --> VM wird zerstört
    vagrant reload --> Änderungen werden vorgezogen

# Bash und Git
## Was ist Bash und Git ?

<p>Bash ist eine Shell. Bash wird Verwendet zur Ausführung von Shellscripts und zum Einloggen auf Virtuellen Maschinen.</br>
Git ist eine Software zur verteilten Versionsverwaltung von Dateien.</p>

## Repository von GitHub klonen

<p>Shell starten</p>

    git config --global user.name "<username>"
    git config --global user.email "<mail>"
    git clone link

# Virtualbox
## Was ist Virtualbox

<p>Virtualbox ist eine Software, die erlaubt lokal auf dem PC virtuellen Maschinen zu erstellen und zu verwalten.</p>

# Visual Studio Code
## Was ist Visual Studio Code ?

<p>Visual Studio Code ist ein Source Code Editor.</p>

## Einstellungen für Visual Studio Code

    // Der Pfad zur ausführbaren Git-Datei.
    "git.path": "C:\\Program Files\\Git\\bin\\git.exe",
    // Passt an, welches Terminal für Windows ausgeführt werden soll.
    "terminal.external.windowsExec": "C:\\Program Files\\Git\\git-bash.exe",
    // Der Pfad der Shell, den das Terminal unter Windows verwendet.
    "terminal.integrated.shell.windows": "C:\\Program Files\\Git\\git-bash.exe",
    // Konfiguriert die Globmuster zum Ausschließen von Dateien und Ordnern.
    "files.exclude": {
        "**/.git": true,
        "**/.svn": true,
        "**/.hg": true,
        "**/.vagrant": true,
        "**/.DS_Store": true
    },

# Apache

## Was ist Apache ?

<p>Apache wird verwendet um einen Webserver zu betreiben.</p>

## Einstellungen für Apache

<p>Port Forwarding --> VM Hülle</p>
    
    config.vm.network "forwarded_port", guest: 80, host: 8080

<p>Apache installieren und testen</p>

    sudo apt-get install apache2 -y
    Browser öffnen --> URL: localhost:8080

![Apache](picture/webserver.jpg)

# Firewall

## Was ist eine Firewall ?

<p> Eine Firewall schützt das lokale Netzwerk von unerlaubten Netzwerkzugriffe.</p>

## Firewall installieren

    sudo apt-get install ufw --> UFW installieren
    sudo ufw status --> Firewall Status anzeigen
    sudo ufw enable --> Firewall aktivieren
    sudo ufw disable --> Firewall deaktivieren

## Meine Firewall Regeln

    # Port 80 (HTTP) öffnen für alle
    sudo ufw allow 80/tcp
    sudo ufw -f enable
    exit

    # Port 22 (SSH) nur für den Host öffnen
    sudo ufw allow from 10.0.2.15 to any port 22
    exit

    # Port 3306 (MySQL) nur für den web Server öffnen
    vagrant ssh database
    sudo ufw allow from localhost:3306 to any port 3306
    sexit

## Firewall Testen

    curl -f 10.0.2.15 --> HTML Code sollte angezeigt werden
    curl -f localhost:3306 --> MySQL
    sudo ufw status --> Aktive Firewallregeln
    
![Firewall](picture/firewall.jpg)


# MySQL

## Was ist MySQl ?

<p>MySQL ist eine Datenbank</p>

## MySQL Konfig Passwort setzen

    debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
    debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'

## MySQL installieren

    sudo apt-get install mysql-server -y

## MySQL Testen

    mysqladmin -u root -p status --> MySQL Login

![MySQL](picture/mysql.jpg)

# Docker

## Was ist Docker ?
<p>Die Docker-Plattform besteht vereinfacht gesagt aus zwei getrennten Komponenten: der Docker Engine, die für das Erstellen und
Ausführen von Containern verantwortlich ist, sowie dem Docker Hub, einem Cloud Service, um Container-Images zu verteilen.</p>

    Docker Tools Installieren

## Befehle für Docker

    docker run hello-world --> Installation Überprüfen
    docker run -it ubuntu /bin/bash --> Container mit Shell
    docker run -d ubuntu sleep 20 --> Container im Hintergrund
    docker run -d ubuntu touch /tmp/lock --> Container und File erstellen
    docker ps --> Überblick über alle Containern
    docker rm <name> --> Container löschen
    docker rm `docker ps -a -q` --> Beendenten Container lösch.
    docker rm -f `docker ps -a -q` --> Auch Aktive löschen
    docker rmi ubuntu --> ISO löschen
    docker start <id> --> Gestoppte Container starten
    RAM begrenzen --> docker run -m 2096m --memory-swap 2096m

## Dockerfile einrichten und testen
<p>1. Dockerfile im Verzeichnis erstellen</p>
<p>2. Image anhand vom Dockerfile erstellen</p>

>docker build -t webserver .

![Images](picture/images.jpg)

## Container starten
    docker run -d -p 8080:80 webserver

![containerstart](picture/containerstart.jpg)

    Aktive Container anzeigen --> docker ps

![containerruning](picture/containerrunning.jpg)

## Webserver Testen
<p> Es gibt zwei Arten um zu schauen ob der Dienst läuft</p>

![dockerip](picture/dockerip.jpg)

> curl http://192.168.99.100:8080

![dockercurl](picture/dockercurl.jpg)

<p>Über einem Browser</p>

![dockerweb](picture/dockerweb.jpg)

## Firewall Regeln nachschauen

    docker exec -it 0f04ee636332 bash
    ufw status

## Monitoring

<p>Über CMD</>

>docker stats

![cmd](picture/cmd.jpg)


<p>Mit Cadvisor</p>

    docker run -d --name cadvisor -v /:/rootfs:ro -v /var/run:/var/run:rw -v /sys:/sys:ro -v /var/lib/docker/:/var/lib/docker:ro -p 8080:8080 webserver/cadvisor

![mon1](picture/mon1.jpg)
![mon2](picture/mon2.jpg)
![mon3](picture/mon3.jpg)
![mon4](picture/mon4.jpg)

## Docker User

<p>Mit diesem Befehl kann ein Docker user erstellt werden </p>

>RUN groupadd -r User_Group && useradd -r -g User_group xyz


## Mögliche Befehle für Markdown
# headers

*emphasis*

**strong**s

* list

>block quote

    code (4 spaces indent)
[links](http://wikipedia.org)

----
## changelog
* 17-Feb-2013 re-design

----
## thanks
* [markdown-js](https://github.com/evilstreak/markdown-js)
