# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Language.destroy_all
Site.destroy_all


Language.create(:name=>'Русский', :code=>'ru-RU')
User.last.sites.create(:name=>'Тестовый сайт', :language=>Language.first)
User.last.sites.last.rules.create([{:phrase=>"привет", :link=>'/hello'}, {:phrase=>'пока', :link=>'/bye'}])
