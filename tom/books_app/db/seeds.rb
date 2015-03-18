Book.destroy_all
Author.destroy_all

b1 = Book.create(:title => 'Into The Wild', :year => '1996', :pages => '224', :language => 'English', :genre => 'Biography/True', :image => 'http://www.carinemccandless.com/wp-content/uploads/2011/03/ITW_Cover.jpg')

b2 = Book.create(:title => 'The Shining', :year => '1977', :pages => '497', :language => 'English', :genre => 'Horror', :image => 'http://upload.wikimedia.org/wikipedia/en/4/4c/Shiningnovel.jpg')

b3 = Book.create(:title => 'It', :year => '1986', :pages => '1138', :language => 'English', :genre => 'Horror', :image => 'http://upload.wikimedia.org/wikipedia/en/5/5a/It_cover.jpg')

b4 = Book.create(:title => 'Lord of the Rings: The Fellowship of the Ring', :year => '1954', :pages => 'lots', :language => 'English', :genre => 'Fantasy', :image => 'https://exploringclassics.files.wordpress.com/2014/07/the-fellowship.jpg')

b5 = Book.create(:title => 'Lord of the Rings: The Two Towers', :year => '1954', :pages => 'Lots', :language => 'English', :genre => 'Fantasy', :image => 'http://www.authormedia.com/wp-content/uploads/2013/05/two-towers.jpg')

b6 = Book.create(:title => 'Lord of the Rings: The Return of the King', :year => '1955', :pages => 'lots', :language => 'English', :genre => 'Fantasy', :image => 'http://ecx.images-amazon.com/images/I/81UzbZbGPUL._SL1500_.jpg')



a1 = Author.create(:name => 'Jon Krakauer', :dob => '12/04/1954', :nationality => 'American', :image => 'http://www.widercontexts.gyldendal.dk/~/media/Gymnasium/widercontexts/Man%20and%20nature/jon_krakauer.ashx')

a2 = Author.create(:name => 'Stephen King', :dob => '21/09/1947', :nationality => 'American', :image => 'http://upload.wikimedia.org/wikipedia/vi/3/33/Skheadshot.jpg')

a3 = Author.create(:name => 'J. R. R. Tolkien', :dob => '03/01/1892', :nationality => 'British', :image => 'http://graphics8.nytimes.com/images/2012/12/18/sports/tennis/18tolkienpic/18tolkienpic-superJumbo.jpg')


a1.books << b1
a2.books << b2
a2.books << b3
a3.books << b4
a3.books << b5
a3.books << b6


# need to find an author with 2 books, 3 books and 4 books
