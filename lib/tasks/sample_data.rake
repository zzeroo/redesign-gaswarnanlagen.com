namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_product_groups
    #make_products
  end
end

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
#    99.times do |n|
#      name = Faker::Name.name
#      email = "example-#{n+1}@gaswarnanlagen.com"
#      password = "password"
#      User.create!(name: name,
#                  email: email,
#                  password: password,
#                  password_confirmation: password)
#    end
end


def make_product_groups
  ProductGroup.create!(name: "CO Warnanlagen",
                      description: "CO-Warnanlage zur Überwachung des Kohlenmonoxidgehaltes der Atemluft in Tiefgaragen gemäß VDI 2053. Senkung der Investitionskosten, Senkung der Betriebskosten, hohe Flexibilität bei Änderungen und Erweiterungen der vorhandenen Systeme, Visualisierung und Fernüberwachung der Anlage auf der Gebäudeleitebene auf Basis des LON® -Talk-Protokolls Komponenten sind weltweit standardisierte LON® - Produkte basierend auf einer ausgereiften und zukunftsfähigen Technologie.")
  ProductGroup.create!(name: "Gaswarnanlagen",
                      description: "Gaswarnanlagen vom Standardprogramm bis zur kundenspezifischen Lösung. Wir bieten das Universalprogramm zur Messung und Auswertung für brennbare und toxische Gase, explosive Dämpfe, Kältemittel. Ob als Kompaktwarnanlage im AP-Gehäuse aus Kunststoff oder als Schaltschrankeinbaugerät. Gaswarnanlagen als zuverlässige Schutz- und Alarm-Funktion im Einsatz zur Vermeidung von Personen-, Sach- und Umweltschäden.")
  ProductGroup.create!(name: "Messfühler",
                      description: "Messfühler zum Einsatz an Gaswarnanlagen für brennbare und toxische Gase, explosive Dämpfe oder Kältemittel als Halbleiter, Pelistor, elektrochemischem Sensor oder mit Infrarotmessverfahren.")
  ProductGroup.create!(name: "Leuchttransparente",
                      description: "Zeichenschreibung mit rechtlich geschütztem multilingualen Design, und somit international allgemein verständlich. Über Versorgungsspannung zentral aktivierbar, Akku-Entladeschutz, geringe Anschlussleistung, LED-Leuchtmittel hoher Betriebsdauer, große Erkennungsweite und sehr hoher Aufmerksamkeitsfaktor.")
end

def make_products
  product_groups = ProductGroup.all(limit: 4)
  50.times do |p|
    number = "%d%02d-%03d" % [p/10, p, p]
    description = Faker::Lorem.sentence(1)
    short_description = Faker::Lorem.sentence(2)
    product_groups.each {|product_group| product_group.products.create!(number: number, description: description, short_description: short_description) }
  end
end

