Redesign gaswarnanlagen.com
===========================

Vorschlag für die neue, dynamische gaswarnanlagen.com Webseite.

Milestones
----------

1. ~~Statisches responsitive Layout~~
2. ERD Dokumentation anfertigen
3. Excel Import/ Export (http://railscasts.com/episodes/396-importing-csv-and-excel?view=asciicast)

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

