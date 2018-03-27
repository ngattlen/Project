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


## Mögliche Befehle für Markdown
# headers

*emphasis*

**strong**

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
