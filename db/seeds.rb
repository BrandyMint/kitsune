# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Language.create(:name=>'Русский', :code=>'ru_RU')
site = Site.create(:name=>'Тестовый сайт', :language=>Language.first)
site.rules.create([{:phrase=>"hello", :link=>'/hello'}, {:phrase=>'/bye', :link=>'bye'}])
