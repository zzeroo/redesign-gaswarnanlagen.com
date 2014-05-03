Redesign gaswarnanlagen.com
===========================

Vorschlag für die neue, dynamische gaswarnanlagen.com Webseite.

Der erste Ausbau sollte alles in Allem eine Kopie der alten Webseite darstellen.
Alle Funktionen der “alten” Webseite sollen auch in der neuen Webseite
funktionieren.
Zudem soll es möglich sein Exeltabellen mit Produkt Daten zu importieren.

Aufbau der Webseite
----

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


Milestones
----------

1. ~~Statisches responsitive Layout~~
1. ~~Excel Import/ Export (http://railscasts.com/episodes/396-importing-csv-and-excel?view=asciicast)~~
1. ERD Dokumentation anfertigen
1. Produkte mit Passwort schützen
1. Im Header der Navigation das RA-GAS GmbH durch ein schwarz/ weißes Logo ersetzen
1. Module “Aktuell” und “Nachrichten” erstellen

Dokumentation
-------------

Die Dokumentation kann mit dem Befehle `rdoc --format=fivefish` erstellt werden.

### Darstellung der Modelbezieungen

Die visuelle Darstellung der Beziehungen der Modelle untereinander sollte mit dem Ruby Tool ERD erstellt werden.

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

