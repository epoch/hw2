Genre.destroy_all
Song.destroy_all
Album.destroy_all
Artist.destroy_all
User.destroy_all
Mixtape.destroy_all

g1 = Genre.create(:name => "Funk")
g2 = Genre.create(:name => "Rap")
g3 = Genre.create(:name => "Rock")

s1 = Song.create(:name => "Uptown Funk")
s2 = Song.create(:name => "Changes")
s3 = Song.create(:name => "Hells Bells")

a1 = Album.create(:name => "Uptown Funk")
a2 = Album.create(:name => "Greatest Hits")
a3 = Album.create(:name => "Back in Black")

r1 = Artist.create(:name => "Mark Ronson")
r2 = Artist.create(:name => "2Pac")
r3 = Artist.create(:name => "AC/DC")

u1 = User.create(:name => "Pekka", :password => "chicken", :password_confirmation => "chicken")
u2 = User.create(:name => "Olli", :password => "chicken", :password_confirmation => "chicken")
u3 = User.create(:name => "Janita", :password => "chicken", :password_confirmation => "chicken")
admin = User.create(:name => "admin", :password => "admin", :password_confirmation => "admin",
 :is_admin => true)

m1 = Mixtape.create(:name => "One Drop")
m2 = Mixtape.create(:name => "Jamzz")
m3 = Mixtape.create(:name => "Party")

# Associate songs and artists:
r1.songs << s1
r2.songs << s2
r3.songs << s3

# Associate songs and genres:
g1.songs << s1
g2.songs << s2
g3.songs << s3

# Associate songs and albums:
a1.songs << s1
a2.songs << s2
a3.songs << s3

# Associate songs and mixtapes:
m1.songs << s2
m2.songs << s1
m3.songs << s3

#Associate mixtapes and users:
u1.mixtapes << m1
u2.mixtapes << m2
u3.mixtapes << m3

# g1.songs << s1
# g2.songs = [s2]
# g2.save
# g3.songs = s3

