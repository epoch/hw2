Author.destroy_all
Book.destroy_all

Author.create(:name => 'Harper Lee', :nationality => 'American', :dob => 'April 28 1926', :dod => '', :university => 'University of Alabama', :highlight => 'Pulitzer Prize', :num_books => '2', :image => 'http://upload.wikimedia.org/wikipedia/commons/c/c6/Nelle_Harper_Lee.jpg')
Book.create(:title => 'To Kill a Mockingbird', :published => '1960', :publisher => 'J. B. Lippincott', :author_id => '', :award => 'Pulitzer Prize', :image => 'https://img0.etsystatic.com/000/0/5871645/il_fullxfull.270721308.jpg')