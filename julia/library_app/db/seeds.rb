Author.destroy_all
Book.destroy_all

a1 = Author.create(:name => 'Fyodor Dostoyevsky', :dob => '1821/11/11', :nationality => 'Russian', :image => 'http://upload.wikimedia.org/wikipedia/commons/9/9b/Dostoevskij_1863.jpg')

b1 = Book.create(:title => 'Crime and Punishment', :year => '1866', :publisher => 'The Russian Messenger', :genre => 'Philosophical, Psychological, Mystery', :isbn => '0679734503 9780679734505', :summary => 'Raskolnikov, an impoverished student, conceives of himself as being an extraordinary young man and then formulates a theory whereby the extraordinary men of the world have a right to commit any crime if they have something of worth to offer humanity. To prove his theory, he murders an old, despicable pawnbroker and her half-sister who happened to come upon him suddenly. Immediately after the crime, he becomes ill and lies in his room semi-conscious for several days.', :image => 'http://upload.wikimedia.org/wikipedia/en/4/4b/Crimeandpunishmentcover.png')

a1.books << b1
