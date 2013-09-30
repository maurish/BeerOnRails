require 'spec_helper'

describe 'User' do 
	include OwnTestHelper
	before :each do 
		@user = FactoryGirl.create :user
	end

	describe 'who has signed up' do
		it 'can sign in using credentials' do 
			sign_in @user.username, @user.password
			expect(page).to have_content 'Welcome back'
			expect(page).to have_content 'Pekka'
		end

		it 'will be redirected back if credentials were wrong' do 
			sign_in @user.username, 'wrong'
			
			expect(current_path).to eq(signin_path)
    		expect(page).to have_content 'username and password did not match'
		end
	end
	it "when signed up with good credentials, is added to the system" do
		visit signup_path
		fill_in('user_username', :with => 'Brian')
		fill_in('user_password', :with => 'secret55')
		fill_in('user_password_confirmation', :with => 'secret55')

		expect{
			click_button('Create User')
		}.to change{User.count}.by(1)
	end
end