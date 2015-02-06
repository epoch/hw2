User.destroy_all
Cohort.destroy_all

u1 = User.create(:name => 'Sonya')
u2 = User.create(:name => 'Laura')
u3 = User.create(:name => 'Lynette')

c1 = Cohort.create(:year => '2015')

c1.users << u1 << u2 << u3