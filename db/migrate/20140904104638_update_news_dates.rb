class UpdateNewsDates < ActiveRecord::Migration
  # Create the news like it was on the old site
  #
  # TODO: Refactor this, maybe with a json file
  def change
    news = News.find_by_title( "Aufstieg in die Handball-Baden-Württemberg-Oberliga (BWOL)" )
    news.update!( news_date: "22.02.2014 13:00:00" ) unless news.nil?

    news = News.find_by_title( "SC Korb schafft Aufstieg in die Württembergliga" )
    news.update!( news_date: "01.04.2011 13:00:00" ) unless news.nil?

    news = News.find_by_title( "SC Korb ist Württembergischen Meister 2011. Herzlichen Glückwunsch!" )
    news.update!( news_date: "20.03.2011 13:00:00" ) unless news.nil?

    news = News.find_by_title( "Markteinführung GMZ 2.1" )
    news.update!( news_date: "07.08.2010 13:00:00" ) unless news.nil?

    news = News.find_by_title( "Den Mitbewerbern um Längen voraus!" )
    news.update!( news_date: "01.02.2010 13:00:00" ) unless news.nil?

    news = News.find_by_title( "Wir unterstützen aktiv die Jugend des SC Korb!" )
    news.update!( news_date: "05.08.2009 13:00:00" ) unless news.nil?

    news = News.find_by_title( "MdB zu Besuch in Kernen" )
    news.update!( news_date: "01.05.2009 13:00:00" ) unless news.nil?

    news = News.find_by_title( "Lon-Sensoren sind online!" )
    news.update!( news_date: "01.02.2009 13:00:00" ) unless news.nil?

    news = News.find_by_title( "Wir unterstützen die Handball Frauen des SC Korb!" )
    news.update!( news_date: "01.06.2007 13:00:00" ) unless news.nil?
  end
end
