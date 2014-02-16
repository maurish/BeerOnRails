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

u1 = User.create username: "mauri", password: "pauli1", password_confirmation: "pauli1"
u2 = User.create username: "mluukkai", password: "matti1", password_confirmation: "matti1"
u3 = User.create username: "avihavai", password: "arto1", password_confirmation: "arto1"
u4 = User.create username: "Paula", password: "paula1", password_confirmation: "paula1"

lager = Style.create title:'Lager', description: 'This is a description for Lager beer'
pale_ale = Style.create title:'Pale Ale', description: 'This description is for Pale Ale'
porter = Style.create title:'porter', description: 'This description belongs to porter'
weizen =  Style.create title:'Weizen', description: 'Weizen description over here, yo!'

beer1_1 = b1.beers.create :name => "Iso 3", :style => lager
beer1_2 = b1.beers.create :name => "Karhu", :style => lager
beer1_3 = b1.beers.create :name => "Tuplahumala", :style => lager
beer2_1 = b2.beers.create :name => "Huvila Pale Ale", :style => pale_ale
beer2_2 = b2.beers.create :name => "X Porter", :style => porter
beer3_1 = b3.beers.create :name => "Hefezeizen", :style => weizen
beer3_2 = b3.beers.create :name => "Helles", :style => lager

s1 = beer1_1.ratings.create :score => 50, user_id: u1.id
s2 = beer1_2.ratings.create :score => 45 , user_id: u1.id
s3 = beer2_1.ratings.create :score => 30 , user_id: u2.id
s4 = beer2_1.ratings.create :score => 25 , user_id: u2.id

m1 = c2.memberships.create user_id: u1.id
m2 = c2.memberships.create user_id: u2.id
m3 = c3.memberships.create user_id: u2.id
