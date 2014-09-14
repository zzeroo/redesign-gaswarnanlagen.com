[![Build Status](https://travis-ci.org/zzeroo/redesign-gaswarnanlagen.com.svg?branch=master)](https://travis-ci.org/zzeroo/redesign-gaswarnanlagen.com)
[![Coverage Status](https://coveralls.io/repos/zzeroo/redesign-gaswarnanlagen.com/badge.png)](https://coveralls.io/r/zzeroo/redesign-gaswarnanlagen.com)
[![PullReview stats](https://www.pullreview.com/github/zzeroo/redesign-gaswarnanlagen.com/badges/master.svg?)](https://www.pullreview.com/github/zzeroo/redesign-gaswarnanlagen.com/reviews/master)

# Webauftritt
## http://gaswarnanlagen.com
### Redesign und Dynamisierung der Webseite
Informationen und Beschreibungen zum Aufbau der neuen, 
dynamischen (gaswarnanlagen.com) Webseite.

## Anforderung
Im ersten Ausbau sollte alles in Allem eine Kopie der alten Webseite entstehen.
Alle Funktionen der [“alten” Webseite](http://web.archive.org/web/20140517110348/http://gaswarnanlagen.com/) sollen auch in der neuen Webseite
funktionieren.
Zudem soll es möglich sein, Exeltabellen mit Daten von Produkten in die 
Datenbank der Webseite zu importieren. Die Daten aus dem Programm ‘Easy Win Art’
sollten über die Exeltabellen Import Funktion in die Webseite importiert werden
können.

## Aufbau und Logic der Webseite
Auf der Homepage werden Gruppen von Produkten (so genannte Kategorien, im Categories Model)  dargestellt, nur die Gruppen, keine Produkte an sich. Zudem werden aktuelle Informationen aus der Firma (Aktuell) und  Nachrichten (aus eine externen Quelle) dargestellt. 

Klickt man auf eine Produkt Kategorie (Categories Model) werden entweder
Unterkategorien der Kategie oder Produkte die mit dieser Kategorie verbunde
sind (siehe Beziehung Kategorie -> Produkte)

## Beziehungen
### Kategorie zu -> Produkte
Kategorien (Categories) enthalten Produkte (Products) oder Unterkategorien 
(SubCategories through CategoryJoin) oder beides.

http://stackoverflow.com/questions/6097288/how-can-i-do-self-reference-with-ruby-on-rails

```
class Category < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Category'
  has_many :children, :class_name => 'Category', :foreign_key => 'parent_id'
end
```

## Komponenten und Techniken der Webseite
### Bootstrap3
Das CSS Framework der Webseite ist Bootstrap3.

- [Gaps zwischen den Bootstrap3 columns](http://www.andre-abt.com/2013/11/26/how-to-use-the-bootstrap-3-grid-system-with-column-margins/)

### Pagination
Die Pagination wird mit will_paginate und dem Bootstrap3 Renderer will_paginate-bootstrap
realisiert.

- https://github.com/mislav/will_paginate.git
- https://github.com/bootstrap-ruby/will_paginate-bootstrap.git

### Flash Nachrichten
- https://gist.github.com/roberto/3344628

### Tree Navigation (Verwendung in Kategorien)
- http://jsfiddle.net/jhfrench/GpdgF/

### Paperclip (Dateianhänge)
Dateianhänge werden mit dem Paperclip gem realisiert. 
Das erste Model mit Anhang das realisiert wurde war das Category Model, hier
wurde das Logo Attribut als has_one Beziehung realisiert.
Danach wurde im Zuge des Documents Models eine neues Polymorphes Model (AttachedAsset)
entwurfen welches für unterschiedliche Models geeignet sein wird. 

- https://github.com/thoughtbot/paperclip
- http://jimlabs.heroku.com/posts/has-many-file-attachments-using-paperclip
- http://www.tkalin.com/blog_posts/multiple-file-upload-with-rails-3-2-paperclip-html5-and-no-javascript
- http://platypus.belighted.com/blog/2012/04/14/html5-multi-upload-with-paperclip-the-easy-way/

#### Docsplit Dokumenten Konvertierung
```
$ sudo apt-get install graphicsmagick poppler-utils poppler-data ghostscript tesseract-ocr pdftk
```

##### PDF Erstellung
- https://github.com/tienle/docsplit-paperclip-processor

### Mapbox
Mapbox ist die Technologie die hinter der Karte im Kontakt View steckt.

- http://vladigleba.com/blog/2013/11/14/using-mapbox-with-ruby-on-rails/


----

## Aufbau der Entwicklungsumgebung

### AWS EC2 
Die Webseite ist in der Amazon Elastic Cloud gehostet. Zur Verwaltung, wie zum Beispiel zum erstellen eines Backups, muss das Tool awscli lokal installiert werden.

#### awscli
Amazon stellt für den Zugriff auf die Amazon Cloud Dienste ein Tool namens `awscli` zur Verfügung.
Dieses Tool ist ein python Tool das scheinbar auf [Boto](https://github.com/boto/boto) basiert.

Die Installation unter Debian ist denkbar einfach

    sudo apt-get install -y python-pip
    sudo pip install awscli

Diese [Webseite](http://alestic.com/2013/08/awscli) hat ausführliche Infos zu dem Tool.

### Verwendete Werkzeuge
#### Zsh, Tmux, Tmuxinator
Die Entwicklungsumgebung wird durch das Foreman gem gestartet. Außerdem setze ich Tmux, Zsh und [Tmuxinator](https://github.com/tmuxinator/tmuxinator)
ein. Unter dem [Link](http://shapeshed.com/instant-rails-dev-environments-with-tmuxinator-and-foreman/) wird hervorragend erklährt wie diese Tools optimal eingesetzt werden.

#### Pandoc
Mit Pandoc kann Text aus so ziemlich allen gängigen Dateiformaten extrahiert werden.
Außerdem ist es mit Pandoc sehr leicht möglich, ein Dateiformat in ein anders 
umzuwandeln.

Mit dem folgenden Befehl zum Beispiel kann die README im Markdown Format
in eine README im html Format umgewandelt werden.

    pandoc -s README.md -o doc/README.html

das geht natürlich auch mit anderen Dateien als der README

    pandoc -s TODO.md -o doc/TODO.html

##### Pandoc on Steroid

In diesen [Github Repo](https://github.com/tonyblundell/pandoc-bootstrap-template) stellt Tony Blundell eine template.html und template.css Datei zur Verfügung.
Zusammen mit diesem angepassten Befehl erhält man eine Datei gerendert die im Aussehen an die Github Pages erinnert.

    pandoc -s README.md -o doc/README.html --template doc/template.html --css doc/template.css --self-contained --toc --toc-depth 2

### Rails Update
[Diese Webseite beschreibt hervorragend den “Ruby on Rails” Updatevorgang:](http://railsapps.github.io/updating-rails.html)


----

## Aufbau Produktiv System

Folgende Punkte beschreiben das grundlegende Setup, welches auf jedem Produktiv
Server durchzuführen ist.

### Locale einstellen

Mit folgenden Befehlen wird das gesammte System als deutsche Umgebung eingerichtet

    locale-gen de_DE.UTF-8

Anschließend muss noch folgende Zeile in die Datei `/etc/environment` eingefügt, und der Rechner anschließend neu gestartet werden.

    LC_ALL="de_DE.UTF-8"

### Deployment Benutzer und Gruppe

Alle Dienste des Webauftritts werden unter dem Benutzer `gaswarnanlagen` gestartet. Wir legen diesen Benutzer an, geben ihm ein Password und fügen den Benutzer der `sudo` Gruppe hinzu.

    adduser gaswarnanlagen
    gpasswd -a gaswarnanlagen sudo

Zum feineren Abstimmen der Berechtigungen legen wir zum Schluss noch eine Gruppe `deployment` an und fügen den Benutzer `gaswarnanlagen` in diese ein.

    addgroup deployers
    gpasswd -a gaswarnanlagen deployers

### Verzeichnisse anlegen

Die Webseite wird nach `/var/www/gaswarnanlagen.com/` deployed. Folgende Befehle erstellen den Pfad und setzen die Dateisystemberechtigungen.

    mkdir /var/www/gaswarnanlagen.com -p
    chown -R gaswarnanlagen:deployers /var/www/gaswarnanlagen.com/
    chmod -R g+w /var/www/gaswarnanlagen.com/


### SSH Zugang einrichten

    mkdir /home/gaswarnanlagen/.ssh
    cp /home/ubuntu/.ssh/authorized_keys /home/gaswarnanlagen/.ssh/
    chown gaswarnanlagen: /home/gaswarnanlagen/.ssh -R
    chmod u=rwX /home/gaswarnanlagen/.ssh -R

### Installation div. Tools

Folgende Tools müssen installiert werden:
- [Git](http://git-scm.com/)
- [Image Magic](http://www.imagemagick.org/)
- [Zsh](http://www.zsh.org/)

    apt-get install git imagemagick zsh

### RVM Installation

Die Webseite ist eine in Ruby programmierte Ruby-on-Rails  Anwendung. Ruby und Rails werden durch den [ Ruby Version Manager RVM ] installiert.

Dazu werden folgende Befehle als Root ausgeführt

    \curl -sSL https://get.rvm.io | bash -s stable --rails --ruby

    gpasswd -a gaswarnanlagen rvm

### Apache2 und Passenger

Der Webserver wird mit dem Apache2 realisiert, die vermittlung Ruby -> Apache wird durch [ Passenger ][passenger] gehandelt.

    apt-get update
    apt-get upgrade
    apt-get install build-essential
    gem install passenger

    passenger-install-apache2-module

Die genauen Schritte werden hervorragend im `passenger-install-apache2-module` beschrieben. Einfach diesen folgen.


### Postgres Datenbank
Folgende Programme werden auf dem Produktiv System installiert.

    apt-get install postgresql
    apt-get install libpq-dev

Auch in der Postgres Datenbank wird ein eigener Benutzer `gaswarnanlagen` angelgt, und das Password gesetzt.

    sudo su postgres -c psql

    postgres=# CREATE ROLE gaswarnanlagen SUPERUSER LOGIN;
    postgres=# \password gaswarnanlagen
    postgres=# \q

Die Postgres Shell nicht verlassen! Wir legen gleich noch die Datenbank an.

    postgres=# CREATE DATABASE gaswarnanlagen OWNER gaswarnanlagen;

#### Tipp !!DANGER!!!

    service apache2 stop
    su postgres -c 'psql -c "DROP DATABASE gaswarnanlagen;"'
    su postgres -c 'psql -c "CREATE DATABASE gaswarnanlagen OWNER gaswarnanlagen;"'
    service apache2 start


### Capistrano

**Mit dem Befehl `cap production deploy:check` kann überprüft werden ob alle Einstellungen und Dateien passen.**

#### SSH Forwarding
Damit Capistrano auf das Github Repo zugreifen kann müsste eigentlich der Github SSH Key auf den Webserver kopiert werden. Das kann man mit der SSH-Agent-Forwarding Technik umgehen. Dabei wird der lokale SSH-Agent (in jeder Gnome Installation mit dabei und gestartet) beauftragt den Zugriff auf Github frei zu geben, der Webserver fragt also unseren lokalen Rechner, kann der lokale Rechner auf Github zugreifen, dann gibt er diese Erlaubnis an den Webserver weiter. Siehe diesen hervorragenden Blog Post [SSH Agent Forwarding](https://help.github.com/articles/using-ssh-agent-forwarding)

Nun wird capistrano installiert (via Gemfile) und mit `capify .` die nötigen Dateien erzeugt.

    cap deploy:setup

#### Geschützte Konfigurationsdateien

Die S3 und Datenbank Konfiguration `config/s3_credentials.yml` und `config/database.yml` sind nicht im öffentlich zugänglichen Github Repository enthalten, desshalb können diese Dateien auch nicht von Capistrano ausgelesen werden. Capistrano kopiert ja nur das Repo von Github. In der Datei `config/deploy.rb` gibt es einen Eintrag `set :linked_files, %w{ config/database.yml  config/s3_credentials.yml }`, dieser sorgt dafür das Capistrano nach dem Checkout des Github Repos die Dateien `config/database.yml` und `config/s3_credentials.yml` verlinkt (mit dem normalen `ln` Linux Tool)
Die Quelle diese Links sind `/var/www/gaswarnanlagen.com/shared/config/database.yml` bzw. `/var/www/gaswarnanlagen.com/shared/config/s3_credentials.yml`.
Nachdem nun dieses Verzeichnis auf dem Webserver erzeugt wurde, werden die beiden Dateien per `scp` auf den Webserver kopiert.

    ssh gaswarnanlagen@gaswarnanlagen.com -c “mkdir -p /var/www/gaswarnanlagen.com/shared/config”
    scp config/database.yml       gaswarnanlagen@gaswarnanlagen.com:/var/www/gaswarnanlagen.com/shared/config/
    scp config/s3_credentials.yml gaswarnanlagen@gaswarnanlagen.com:/var/www/gaswarnanlagen.com/shared/config/

- [Capistrano Handbuch](https://github.com/leehambley/capistrano-handbook/blob/master/index.markdown)

----

## Problemlösungen und Tricks
### Foreman gem

Scheinbar werden manchmal beim Beenden von Foreman nicht alle Prozesse gestoppt. Folgender Befehl beendet alle Komponenten:

    ps -ef |egrep ‘webkit|rspec|unicorn|rails|solr’ |awk ‘{print $2}’ |xargs kill -9


----

## Datensicherung der AWS EC2 Instance

    aws ec2 create-snapshot --volume-id vol-6f5f3368 --description "root volume snapshot gaswarnanlagen.com"


----

## Resourcen und Links
- Das [Ruby on Rails Tutorial](http://ruby.railstutorial.org/book/ruby-on-rails-tutorial) bietet einen hervorragenden Einstieg in die Welt von RoR
- Und in diesem Blog Post wird erklärt wie man das Layout aus dem Ruby on Rails Tutorial in ein [Responsives Layout](http://techbrownbags.wordpress.com/2013/06/03/rails-tutorial-responsive-web-design) verwandelt

[passenger]: https://www.phusionpassenger.com/





### Solr

Installation der Solr Suche.

Zu Begin wird das System aktualisiert

    sudo apt-get update && sudo apt-get dist-upgrade
    sudo apt-get autoremove

Dannn erfolgt die Installation von Java und Tomcat

    sudo apt-get install openjdk-7-jdk
    sudo apt-get install tomcat7 tomcat7-docs tomcat7-examples tomcat7-admin

In der Konfiguration wird Tomcat der Benutzer und dessen Password übergeben

    cat <<EOF |sudo tee /etc/tomcat7/tomcat-users.xml\
    <?xml version='1.0' encoding='utf-8'?>
    <tomcat-users>
      <role rolename="manager"/>
      <role rolename="admin"/>
      <role rolename="admin-gui"/>
      <role rolename="manager-gui"/>
      <user username="tomcat" password="930440Hk" roles="manager,admin,manager-gui,admin-gui"/>
    </tomcat-users>
    EOF

Jetzt kann Solr heruntergeladen werden

    wget http://mirror.derwebwolf.net/apache/lucene/solr/4.9.0/solr-4.9.0.tgz
    tar xfvz solr-4.9.0.tgz
    sudo mv solr-4.9.0 /usr/share/solr

**Jetzt muss zur Entwicklungsumgebung gewechselt werden.** Hier wird im Root des Repository das gesammte Verzeichnis ./solr gepackt, und auf den Webserver hoch geladen.

    tar cfvz solr.tgz solr
    scp solr.tgz gaswarnanlagen@gaswarnanlagen.com:~/

Anschließend wird wieder auf dem Webserver weiter gearbeitet. Hier wird das soeben hoch geladene solr.tgz Archiv entpackt und das Solr Schema ins System kopiert.

    tar xfvz solr.tgz
    cp ~/solr/conf/schema.xml /usr/share/solr/example/solr/collection1/conf

Folgende Konfiguration konfiguriert den Solr Core

    cat <<EOF |sudo tee /usr/share/solr/example/solr/solr.xml
    <?xml version="1.0" encoding="UTF-8" ?>

    <solr>

      <solrcloud>
        <str name="host">${host:}</str>
        <int name="hostPort">${jetty.port:8983}</int>
        <str name="hostContext">${hostContext:solr}</str>
        <int name="zkClientTimeout">${zkClientTimeout:30000}</int>
        <bool name="genericCoreNodeNames">${genericCoreNodeNames:true}</bool>
      </solrcloud>

      <shardHandlerFactory name="shardHandlerFactory"
        class="HttpShardHandlerFactory">
        <int name="socketTimeout">${socketTimeout:0}</int>
        <int name="connTimeout">${connTimeout:0}</int>
      </shardHandlerFactory>

    </solr>
    EOF

Nun muss noch das Log Verzeichnis erstellt werden.

    sudo touch /usr/share/solr/solr.log
    sudo chown -R tomcat7 /usr/share/solr

Der Pfad dieser Log Datei wird im Konfigurations Attribut `solr.log` der Datei `/usr/share/tomcat7/lib/log4j.properties` eingestellt

    sudo vim /usr/share/tomcat7/lib/log4j.properties

    # Pfad zur Log Datei
    solr.log=/usr/share/solr

Jetzt muss noch der Tomcat konfiguriert werden.

    sudo vim /var/lib/tomcat7/conf/Catalina/localhost/solr.xml

Hierzu muss der folgende Eintrag zu finden sein

    <?xml version="1.0" encoding="utf-8"?>
    <Context docBase="/usr/share/solr/example/solr/solr.war" debug="0" crossContext="true">
      <Environment name="solr/home" type="java.lang.String" value="/usr/share/solr/example/solr" override="true" />
    </Context>

Zum Abschluss der Solr Installation werden noch die Dateisystemberechtigungen gesetzt und der Tomcat Server neu gestartet.

    sudo sudo chown -R tomcat7 /usr/share/solr
    sudo service tomcat7 restart

Nun muss noch der Solr Index neu aufgebaut werden.

    RAILS_ENV=production bundle exec rake sunspot:reindex







