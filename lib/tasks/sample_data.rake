namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_product_groups
    make_products
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
end


def make_product_groups
  ProductGroup.create!(name: "noch nicht zugeordnet",
                      description: "Produkte, noch keiner Produkt Gruppe zugeordnet.",
                      published: false,
                      product_nr_prefix: "")
  ProductGroup.create!(name: "CO Warnanlagen",
                      description: "CO-Warnanlage zur Überwachung des Kohlenmonoxidgehaltes der Atemluft in Tiefgaragen gemäß VDI 2053. Senkung der Investitionskosten, Senkung der Betriebskosten, hohe Flexibilität bei Änderungen und Erweiterungen der vorhandenen Systeme, Visualisierung und Fernüberwachung der Anlage auf der Gebäudeleitebene auf Basis des LON® -Talk-Protokolls Komponenten sind weltweit standardisierte LON® - Produkte basierend auf einer ausgereiften und zukunftsfähigen Technologie.",
                      published: true,
                      product_nr_prefix: "310")
  ProductGroup.create!(name: "Gaswarnanlagen",
                      description: "Gaswarnanlagen vom Standardprogramm bis zur kundenspezifischen Lösung. Wir bieten das Universalprogramm zur Messung und Auswertung für brennbare und toxische Gase, explosive Dämpfe, Kältemittel. Ob als Kompaktwarnanlage im AP-Gehäuse aus Kunststoff oder als Schaltschrankeinbaugerät. Gaswarnanlagen als zuverlässige Schutz- und Alarm-Funktion im Einsatz zur Vermeidung von Personen-, Sach- und Umweltschäden.",
                      published: true,
                      product_nr_prefix: "300")
  ProductGroup.create!(name: "Messfühler",
                      description: "Messfühler zum Einsatz an Gaswarnanlagen für brennbare und toxische Gase, explosive Dämpfe oder Kältemittel als Halbleiter, Pelistor, elektrochemischem Sensor oder mit Infrarotmessverfahren.",
                      published: true,
                      product_nr_prefix: "510")
  ProductGroup.create!(name: "Leuchttransparente",
                      description: "Zeichenschreibung mit rechtlich geschütztem multilingualen Design, und somit international allgemein verständlich. Über Versorgungsspannung zentral aktivierbar, Akku-Entladeschutz, geringe Anschlussleistung, LED-Leuchtmittel hoher Betriebsdauer, große Erkennungsweite und sehr hoher Aufmerksamkeitsfaktor.",
                      published: true,
                      product_nr_prefix: "403")
end

def make_products
  50.times do |p|
    product_nr = "%d%02d-%08d" % [p/10, p, p]
    description = Faker::Lorem.sentence(1)
    short_description = Faker::Lorem.sentence(2)
    Product.create!(product_nr: product_nr, description: description, short_description: short_description) 
  end
end

