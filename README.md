# Redesign gaswarnanlagen.com

Vorschlag für die neue, dynamische gaswarnanlagen.com Webseite.

Der erste Ausbau sollte alles in Allem eine Kopie der alten Webseite darstellen.
Alle Funktionen der “alten” Webseite sollen auch in der neuen Webseite
funktionieren.
Zudem soll es möglich sein Exeltabellen mit Produkt Daten zu importieren.

## Aufbau der Webseite

Auf der Homepage werden Gruppen von Produkten 
(so genannte Kategorien, Categories Model)  dargestellt, 
nur die Gruppen, keine Produkte an sich.  
Zudem werden aktuelle Informationen aus der Firma (Aktuell) und  Nachrichten 
(aus eine externen Quelle) dargestellt. 

Klickt man auf eine Produkt Kategorie (Categories Model) werden entweder
Unterkategorien der Kategie oder Produkte die mit dieser Kategorie verbunde
sind (siehe Beziehung Kategorie -> Produkte)

### Beziehung Kategorie -> Produkte

Kategorien (Categories) enthalten Produkte (Products) oder Unterkategorien 
(SubCategories through CategoryJoin) oder beides.

http://stackoverflow.com/questions/6097288/how-can-i-do-self-reference-with-ruby-on-rails

```
class Category < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Category'
  has_many :children, :class_name => 'Category', :foreign_key => 'parent_id'
end
```


# TODO

1. ~~Statisches responsitive Layout~~
1. ~~Excel Import/ Export (http://railscasts.com/episodes/396-importing-csv-and-excel?view=asciicast)~~
1. ERD Dokumentation anfertigen
1. Produkte mit Passwort schützen
1. Im Header der Navigation das RA-GAS GmbH durch ein schwarz/ weißes Logo ersetzen
1. Module “Aktuell” und “Nachrichten” erstellen
1. Kategorien als Baum darstellen (http://jsfiddle.net/jhfrench/GpdgF/)
1. Bda Controller bda_params anpassen

## Dokumentation

Die Dokumentation kann mit dem Befehle `rdoc --format=fivefish` erstellt werden.

### Darstellung der Modelbezieungen

Die visuelle Darstellung der Beziehungen der Modelle untereinander sollte mit dem Ruby Tool ERD erstellt werden.

### Pagination

Die Pagination wird mit will_paginate und dem Bootstrap3 Renderer will_paginate-bootstrap
realisiert.

- https://github.com/mislav/will_paginate.git
- https://github.com/bootstrap-ruby/will_paginate-bootstrap.git


Resourcen
---------

- <http://ruby.railstutorial.org/book/ruby-on-rails-tutorial>
- <http://techbrownbags.wordpress.com/2013/06/03/rails-tutorial-responsive-web-design>
- <http://rails-erd.rubyforge.org>

- <http://www.mediawiki.org/wiki/Help:Formatting>

Entwicklung
-----------

Die Entwicklungsumgebung wird durch das Foreman gem gestartet. Scheinbar werden beim Beenden von Foreman nicht alle Prozesse gestoppt. Folgender Befehl beendet alle Komponenten:

ps -ef |egrep 'webkit|rspec|unicorn|rails' |awk '{print \$2}' |xargs kill -9

### Flash Nachrichten

<https://gist.github.com/roberto/3344628>

### Hilfreiche Webseiten

- [Gaps zwischen den Bootstrap3 columns](http://www.andre-abt.com/2013/11/26/how-to-use-the-bootstrap-3-grid-system-with-column-margins/)

### Misc

#### ActiveRecord to JSON

Mit den folgenden Ruby Snippets wird das Categoy Model in eine json Datei geschrieben.

```
# Einfach
File.open(‘test_export.json’, ‘w’){ |file| file.write( JSON.pretty_generate(Category.all.as_json )) }

# Auswahl der wichtigen Attribute
File.open(‘test_export.json’, ‘w’){ |file| file.write( JSON.pretty_generate(Category.all.as_json(:except => [ :created_at, :updated_at, :logo_file_name, :logo_content_type, :logo_file_size, :logo_updated_at ]) )) }
```

# Deployment

## Apache (SSL)

```
vim /usr/share/doc/apache2/README.Debian.gz
```

## Solr

- http://stackoverflow.com/questions/23503116/cant-get-solr-4-8-working-with-tomcat-7-and-ubuntu-12-04
- http://gagannaidu.blogspot.no/2014/02/apache-solr-461-tomcat7-setup-on-ubuntu.html


```
% cd
% wget http://mirrors.ae-online.de/apache/lucene/solr/4.8.0/solr-4.8.0.tgz

% sudo mv solr-4.8.0 /usr/share/solr
% sudo cp /usr/share/solr/example/webapps/solr.war /usr/share/solr/example/solr/
% sudo cp -r /usr/share/solr/example/lib/ext/* /usr/share/tomcat7/lib 
% sudo cp -r /usr/share/solr/example/resources/log4j.properties /usr/share/tomcat7/lib
```

```
% sudo vim /usr/share/tomcat7/lib/log4j.properties 
```
```
#  Logging level 
#solr.log=logs/
solr.log=/usr/share/solr
```
```
% sudo touch /usr/share/solr/solr.log
```

```
% sudo vim /var/lib/tomcat7/conf/Catalina/localhost/solr.xml
```
```
<Context docBase=”/usr/share/solr/example/solr/solr.war” debug=”0” crossContext=”true”> 
  <Environment name=”solr/home” type=”java.lang.String” value=”/usr/share/solr/example/solr” override=”true” />
</Context>
```


```
% sudo vim /usr/share/solr/example/solr/solr.xml 
% sudo sudo chown -R tomcat7 /usr/share/solr
% sudo chown -R tomcat7 /usr/share/solr                                                                                                                                        :(
% sudo cp ~/solr/conf/schema.xml /usr/share/solr/example/solr/collection1/conf
% sudo vim  /etc/tomcat7/tomcat-users.xml
%  sudo service tomcat7 restart
```

```
% sudo vim /usr/share/solr/example/solr/solr.xml
```
```
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

```



## Capistrano

- https://github.com/leehambley/capistrano-handbook/blob/master/index.markdown
- https://help.github.com/articles/using-ssh-agent-forwarding

Auf dem Production System wird ein dezidierter Benutzer (gaswarnanlagen) 
angelegt. Zudem wird noch eine Gruppe (deployment) angelgt um 
die Dateisystem Berechtigungen feiner abstimmen zu können.

## Postgres Datenbank auf Production System

Folgende Programme werden auf dem Produktiv System installiert.

```
$ sudo apt-get install postgresql
$ sudo apt-get install libpq-dev
```

Auch in der Postgres Datenbank wird ein eigener Benutzer (gaswarnanlgen)
angelgt.
Dabei wird <username> durch den richtigen Benutzer ersetzt, in diesem Fall
gaswarnanlgen.

```
$ sudo su postgres -c psql
postgres=# CREATE ROLE <username> SUPERUSER LOGIN;
postgres=# \q
```
- http://stackoverflow.com/questions/11092807/installing-postgresql-on-ubuntu-for-ruby-on-rails


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

