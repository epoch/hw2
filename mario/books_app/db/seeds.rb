# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create(:name => 'Roald Dahl', :nationality => 'British', :dob => '1916/09/13', :image => 'http://upload.wikimedia.org/wikipedia/commons/2/29/Roald_Dahl.jpg')
Book.create(:title => 'The Twits', :year => '1980', :genre => 'Children', :image => 'https://blogofgreengables.files.wordpress.com/2012/01/the-twits-by-roald-dahl.jpg')
