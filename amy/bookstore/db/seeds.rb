# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Author.destroy_all
Book.destroy_all

a1 = Author.create(:name => 'J K Rowling', :dob => '1960/04/20', :nationality => 'Scottish', :image => 'http://a4.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE1ODA0OTcxMzcxNTYyNTA5.jpg')
b1 = Book.create(:title => 'Harry Potter', :genre => 'Fantasy', :publisher => 'Penguin', :year => '2000', :isbn => 123456789, :summary => 'Harry Potter is a series of seven fantasy novels written by the British author J. K. Rowling. The series chronicles the adventures of a young wizard, Harry Potter, the titular character, and his friends.', :image => 'http://harrypotterfanzone.com/wp-content/2009/06/ootp-uk-kids-cover-art.jpg')
u1 = User.create(:name => 'Amy', :age => 27, :image => 'https://pbs.twimg.com/profile_images/562928882378997760/XLgyqnOy_400x400.jpeg')

a1.books << b1
u1.books << b1



# miro.works << flight (miro's works is an array so we just attach the flight to that array. if an artist has many works then you can append it)

# flight.artist = miro (the artist who did this flight is miro)
