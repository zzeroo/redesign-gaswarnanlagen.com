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


json = ActiveSupport::JSON.decode(File.read('db/seeds/categories.json'))

json.each do |c|
	Category.create!(c)
end

make_users
