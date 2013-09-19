# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
b1 = Brewery.create :name => "Koff", :year => 1897
b2 = Brewery.create :name => "Malmgard", :year => 2001
b3 = Brewery.create :name => "Weihenstephaner", :year => 1042

c1 = BeerClub.create name: "Ruotsalainen Kaljakerho", city: "Vantaa", founded: 1988
c2 = BeerClub.create name: "HYY Oluen Ystävät", city: "Helsinki", founded: 2000
c3 = BeerClub.create name: "Suuri Suomalainen Kaljakerho", city: "Turku ", founded: 1995

u1 = User.create username: "mauri", password: "pauli", password_confirmation: "pauli"
u2 = User.create username: "mluukkai", password: "matti", password_confirmation: "matti"
u3 = User.create username: "avihavai", password: "arto", password_confirmation: "arto"
u4 = User.create username: "Paula", password: "paula", password_confirmation: "paula"

beer1_1 = b1.beers.create :name => "Iso 3", :style => "Lager"
beer1_2 = b1.beers.create :name => "Karhu", :style => "Lager"
beer1_3 = b1.beers.create :name => "Tuplahumala", :style => "Lager"
beer2_1 = b2.beers.create :name => "Huvila Pale Ale", :style => "Pale Ale"
beer2_2 = b2.beers.create :name => "X Porter", :style => "Porter"
beer3_1 = b3.beers.create :name => "Hefezeizen", :style => "Weizen"
beer3_2 = b3.beers.create :name => "Helles", :style => "Lager"

s1 = beer1_1.ratings.create :score => 100, user_id: u1.id
s2 = beer1_2.ratings.create :score => 75 , user_id: u1.id
s3 = beer2_1.ratings.create :score => 50 , user_id: u2.id
s4 = beer2_1.ratings.create :score => 61 , user_id: u2.id

m1 = c2.memberships.create user_id: u1.id
m2 = c2.memberships.create user_id: u2.id
m3 = c3.memberships.create user_id: u2.id