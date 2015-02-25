User.destroy_all
Cohort.destroy_all

u1 = User.create(:name => 'Sonya', :password => 'chicken', :password_confirmation => 'chicken', :image => "student_placeholder.png")
u2 = User.create(:name => 'Laura', :password => 'chicken', :password_confirmation => 'chicken', :image => "student_placeholder.png")
u3 = User.create(:name => 'Lynette', :password => 'chicken', :password_confirmation => 'chicken', :image => "student_placeholder.png")
u4 = User.create(:name => 'Joel', :password => 'chicken', :password_confirmation => 'chicken', :image => "http://chronicle.com/blogs/profhacker/files/2013/04/Professortocat_v2-300x300.png")
admin = User.create(:name => 'admin', :password => 'admin', :password_confirmation => 'admin', :image => "https://lh6.ggpht.com/Fudz3AikqUsxWYDgQHZMR1PSPCtyl1zVwJa1Do3B8roz3sOhmhIh6g_YHLVWqHo0EX4=w300", :is_admin => true)

c1 = Cohort.create(:cohort => 'UG 1', :year => '2015')

c1.users << u1 << u2 << u3 << u4 << admin