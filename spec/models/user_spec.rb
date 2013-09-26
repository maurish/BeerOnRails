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
		let(:user){User.create username:"pekka", password:"secret1", password_confirmation:"secret1" }
		

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

	describe 'user is not saved when password' do 
		it 'is too short' do 
			user = User.create username: 'pekka', password: 's1', password_confirmation:'s1'

			expect(user.valid?).to eq false
			expect(User.count).to eq 0
		end

		it 'only contains letters' do 
			user = User.create username:'pekka', password: "secret", password_confirmation:"secret"

			expect(user.valid?).to eq false
			expect(User.count).to eq 0
		end
	end 
end
