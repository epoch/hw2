Book.destroy_all
Author.destroy_all

Book.create(:title => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmer\'s Guide', :publisher => 'Pragmatic Bookshelf', :year => '2004', :image => 'https://imagery.pragprog.com/products/355/ruby4.jpg?1378671145')

Author.create(:name => 'Dave Thomas', :nationality => 'English', :dob => '1974/04/20', :image => 'http://upload.wikimedia.org/wikipedia/commons/f/fe/Dave_Thomas_speaking_at_the_Pasadena_Rails_Studio.jpg')

