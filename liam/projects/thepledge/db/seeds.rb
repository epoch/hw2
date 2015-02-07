User.destroy_all
Challenge.destroy_all
Pledge.destroy_all

# Seed data for Users
u1 = User.create(:name => 'Liam', :email => 'liamdarmody@gmail.com', :password => 'chicken', :password_confirmation => 'chicken')
u2 = User.create(:name => 'Joel', :email => 'joel@joel.com', :password => 'chicken', :password_confirmation => 'chicken')
u3 = User.create(:name => 'John', :email => 'john@john.com', :password => 'chicken', :password_confirmation => 'chicken')

# Seed data for Challenges
c1 = Challenge.create(:title => 'Air Guitar Challenge', :description => 'The air guitar challenge is a fundraising activity involving filming your best air guitar rendition and uploading it to youtube/ facebook to encourage donations for a worthy cause. Don’t be shy, give us your most rocking performance and tell us why you think this is a worthy cause! Once you’ve completed the activity, feel free to invite others to accept the challenge!', :nominee_name => 'Joel Turnbull', :nominee_email => 'joel@joel.com', :banner_image => 'http://3.bp.blogspot.com/_UgJT7XB2G0Y/S9yVCSbPB5I/AAAAAAAANQo/6IE2tnl9QUY/s1600/family+guy5+800x600.jpg', :cause => 'Code Club Australia', :target => '500', :published => 'true')

# Seed data for Pledges
p1 = Pledge.create(:amount => '50', :reason => 'To see Joel do air guitar.')

# Associating Challenges with Users
c1.user_id = u1.id
c1.save

# Associating Pledges with Users
p1.user_id = u1.id
p1.save

# Associating Pledges with Challenges
p1.update :challenge_id => c1.id