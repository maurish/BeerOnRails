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
		let (:user) {FactoryGirl.create :user}
		it "has method for determining one" do
			user.should respond_to :favorite_beer
		end

		it "has no without any given ratings" do 
			expect(user.favorite_beer).to eq nil 
		end
	end
end
