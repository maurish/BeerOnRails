require 'spec_helper'

describe User do

	it "has the username set correctly" do
		user = User.new :username => "Pekka"
		user.username.should == "Pekka"
	end

	it 'is not saved without proper password' do
		user = User.create username: "pekka"
		expect(user.valid?).to eq false
		expect(User.count).to eq 0
	end

	describe 'with proper password' do 
		let(:user){FactoryGirl.create :user}
		

		it 'is saved' do
			expect(user.valid?).to eq true
			expect(User.count).to eq 1
		end

		it "and with two ratings, has the correct average rating" do
			rating1 = Rating.new :score => 10
			rating2 = Rating.new :score => 20

			user.ratings << rating1
			user.ratings << rating2

			expect(user.ratings.count).to eq 2 
			expect(user.average_rating).to eq 15.0
	    end
	end

	describe 'is not saved with password being' do 
		it 'too short' do 
			user = User.create username: 'pekka', password: 's1', password_confirmation:'s1'

			expect(user.valid?).to eq false
			expect(User.count).to eq 0
		end

		it 'only composed of letters' do 
			user = User.create username:'pekka', password: "secret", password_confirmation:"secret"

			expect(user.valid?).to eq false
			expect(User.count).to eq 0
		end
	end 

	describe "favorite beer" do
		let(:user){FactoryGirl.create :user }

		it "has method for determining one" do
			user.should respond_to :favorite_beer
		end

		it "without ratings does not have one" do
			expect(user.favorite_beer).to eq nil
		end

		it "is the only rated if only one rating" do
			beer = create_beer_with_rating 10, user

			expect(user.favorite_beer).to eq beer 
		end

		it "is the one with highest rating if several rated" do
			create_beers_with_ratings 10, 20, 15, 7, 9, user
			best = create_beer_with_rating 25, user

			expect(user.favorite_beer).to eq best 
		end		
	end

	describe 'favorite style' do 
		let(:user){FactoryGirl.create :user}
		it 'has method for determining one' do
			user.should respond_to :favorite_style
		end

		it 'without ratings does not have one' do 
			expect(user.favorite_style).to eq nil
		end

		it 'is the style of the beer if only one rating' do 
			beer = create_beer_with_rating 10, user
			expect(user.favorite_style).to eq beer.style
		end

		it 'is the style of the highest average mapped by style' do
			create_beers_with_ratings_and_style 10,15,25, user, 'Lager'
			beer = create_beer_with_rating_and_style 30, user, 'Pale Ale'
			expect(user.favorite_style).to eq beer.style
		end
	end

	describe 'favorite brewery' do 
		let(:user){FactoryGirl.create :user}
		it 'has method for determining one' do
			user.should respond_to :favorite_brewery
		end	

		it 'without ratings does not have one' do
			expect(user.favorite_brewery).to eq nil
		end

		it 'is the brewery of the beer, if only one rating' do
			beer = create_beer_with_rating 10,user
			expect(user.favorite_brewery).to eq beer.brewery
		end

		it 'is the style of the highest average mapped by brewery' do 
			create_brewery_with_beers_with_ratings 10,15,25, user, 'anonymous'
			brewery = create_brewery_with_beers_with_ratings 20,20, user, 'kotipanimo'
			expect(user.favorite_brewery).to eq brewery
		end

		def create_brewery_with_beers_with_ratings *scores, user, name
			brewery = FactoryGirl.create :brewery, name:name
			scores.each do |score|
				beer = FactoryGirl.create :beer, brewery:brewery
				rating = FactoryGirl.create :rating, beer:beer, user:user, score:score
			end
			brewery
		end
	end

	def create_beers_with_ratings_and_style *scores, user, style
		scores.each do |score|
			create_beer_with_rating_and_style score, user, style
		end
	end

	def create_beer_with_rating_and_style score, user, style
		beer = FactoryGirl.create :beer, style:style
		FactoryGirl.create :rating, beer:beer, user:user, score:score
		beer
	end

	def create_beers_with_ratings(*scores, user)
		scores.each do |score|
			create_beer_with_rating score, user
		end
	end

	def create_beer_with_rating(score,  user)
		beer = FactoryGirl.create :beer
		FactoryGirl.create :rating, score: score,  beer: beer, user: user 
		beer
	end
end