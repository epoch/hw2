User.destroy_all
Cohort.destroy_all

u1 = User.create(:name => 'Sonya', :password => 'chicken', :password_confirmation => 'chicken')
u2 = User.create(:name => 'Laura', :password => 'chicken', :password_confirmation => 'chicken')
u3 = User.create(:name => 'Lynette', :password => 'chicken', :password_confirmation => 'chicken')
admin = User.create(:name => 'admin', :password => 'admin', :password_confirmation => 'admin', :is_admin => true)

c1 = Cohort.create(:year => '2015')

c1.users << u1 << u2 << u3