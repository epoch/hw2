User.destroy_all
Cohort.destroy_all

u1 = User.create(:name => 'Sonya', :password => 'chicken', :password_confirmation => 'chicken', :image => "student_placeholder.png")
u2 = User.create(:name => 'Laura', :password => 'chicken', :password_confirmation => 'chicken', :image => "student_placeholder.png")
u3 = User.create(:name => 'Lynette', :password => 'chicken', :password_confirmation => 'chicken', :image => "student_placeholder.png")
admin = User.create(:name => 'admin', :password => 'admin', :password_confirmation => 'admin', :image => "student_placeholder.png", :is_admin => true)

c1 = Cohort.create(:year => '2015')

c1.users << u1 << u2 << u3