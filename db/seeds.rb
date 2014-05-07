# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'active_support'
require 'json'

def make_users
  User.create!(name: "Stefan Müller",
              email: "s.mueller@it.kls-glt.de",
              password: "930440",
              password_confirmation: "930440",
              admin: true)
  User.create!(name: "Webmaster",
              email: "webmaster@gaswarnanlagen.com",
              password: "930440",
              password_confirmation: "930440",
              admin: false)
end

def make_categories
  json = ActiveSupport::JSON.decode(File.read('db/seeds/categories.json'))

  json.each do |c|
    Category.create!(c)
  end
end

def add_category_logo
    Category.find(1).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/home-co-warnanlage-01.jpg"))
    Category.find(2).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/home-gaswarnanlage-01.jpg"))
    Category.find(11).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/home-messfuehler-01.jpg"))
    Category.find(20).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/home-leuchttransparente-01.jpg"))
    
    Category.find(3).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/gaswarnanlagen-01.jpg"))
    Category.find(4).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/gaswarnanlagen-02.jpg"))
    Category.find(5).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/gaswarnanlagen-03.jpg"))
    Category.find(6).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/gaswarnanlagen-04.jpg"))
    Category.find(7).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/gaswarnanlagen-05.jpg"))
    Category.find(8).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/gaswarnanlagen-06.jpg"))
    Category.find(9).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/gaswarnanlagen-07.jpg"))
    Category.find(10).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/gaswarnanlagen-08.jpg"))


    Category.find(12).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/messfuehler-01.jpg"))
    Category.find(13).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/messfuehler-00.jpg"))    
    Category.find(14).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/messfuehler-03.jpg"))    
    Category.find(15).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/messfuehler-00.jpg"))    
    Category.find(16).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/messfuehler-05.jpg"))    
    Category.find(17).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/messfuehler-01.jpg"))    
    Category.find(18).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/messfuehler-07.jpg"))    
    Category.find(19).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/messfuehler-08.jpg"))
    
    Category.find(21).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/leuchttransparente-01.jpg"))    
    Category.find(22).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/leuchttransparente-02.jpg"))    
    Category.find(23).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/leuchttransparente-03.jpg"))    
    Category.find(24).update_attributes(logo: File.new("#{Rails.root}/app/assets/images/leuchttransparente-04.jpg"))    
end


def make_news
  News.create!(title: "Aufstieg in die Handball-Baden-Württemberg-Oberliga (BWOL)", updated_at: "22.02.2014 13:00:00", news_body: "Mit einem 26:17-Sieg bei der HSG Strohgäu holen sich die Korber Frauen die beiden noch benötigten Punkte und führen vier Spieltage vor Schluss uneinholbar die Tabelle der Württemberliga Nord an. Endlich darf man in Korb das A-Wort in den Mund nehmen. AUFSTIEG in die BWOL... http://www.sckorb-handball.de/frauen1/presse1314.html", news_image: File.new("#{Rails.root}/app/assets/images/aufsteiger2011.jpg"))

  News.create!(title: "SC Korb schafft Aufstieg in die Württembergliga", updated_at: "01.04.2011 13:00:00", news_body: "Den Frauen des SC Korb gratulieren wir zum Aufstieg in die Württembergliga.", news_image: File.new("#{Rails.root}/app/assets/images/aufsteiger2011.jpg"))

  News.create!(title: "SC Korb ist Württembergischen Meister 2011. Herzlichen Glückwunsch!", updated_at: "20.03.2011 13:00:00", news_body: "Die A-Jugend des SC Korb ist Württembergischen Meister 2011. Herzlichen Glückwunsch!", news_image: File.new("#{Rails.root}/app/assets/images/ajugend_wl2011.jpg"))

  News.create!(title: "Markteinführung GMZ 2.1", updated_at: "07.08.2010 13:00:00", news_body: "Event: Markteinführung der GMZ 2.1", news_image: File.new("#{Rails.root}/app/assets/images/GMZ2_1.gif"))

  News.create!(title: "Den Mitbewerbern um Längen voraus!", updated_at: "01.02.2010 13:00:00", news_body: 'Von 15 Mitbewerbern wurde der Firma RA-GAS der Auftrag zur Erneuerung der CO-Warnanlage im "DB-Blue Taunusanlage 12" erteilt. Der Grund war nicht nur der Preis sondern vor allem die LON®-Technik, welche es den Betreiber ermöglicht, jeden einzelnen Sensor auf einer Gebäudeleittechnik darzustellen und auszuwerten. Eine Kostenersparnis von ca. 25% wurde durch die LON-Verkabelung erzielt.', news_image: File.new("#{Rails.root}/app/assets/images/dbblue-2a8d4a24.png"))

  News.create!(title: "Wir unterstützen aktiv die Jugend des SC Korb!", updated_at: "05.08.2009 13:00:00", news_body: "", news_image: File.new("#{Rails.root}/app/assets/images/frauen1_sckorb-02d5a2d3.jpg"))

  News.create!(title: "MdB zu Besuch in Kernen", updated_at: "01.05.2009 13:00:00", news_body: "<a href='http://www.cdu-kernen.de/index.php/2009/05/dr-joachim-pfeiffer-mdb-zu-besuch-in-kernen/#more-758'>Dr. Joachim Pfeiffer MdB zu Besuch in Kernen</a>", news_image: File.new("#{Rails.root}/app/assets/images/Kugelneu.jpg"))

  News.create!(title: "Lon-Sensoren sind online!", updated_at: "01.02.2009 13:00:00", news_body: "", news_image: File.new("#{Rails.root}/app/assets/images/Kugelneu.jpg"))

  News.create!(title: "Wir unterstützen die Handball Frauen des SC Korb!", updated_at: "01.06.2007 13:00:00", news_body: "", news_image: File.new("#{Rails.root}/app/assets/images/frauen06.jpg"))
end




make_users
make_categories
add_category_logo
make_news



