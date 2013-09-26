require 'spec_helper'

describe User do

	it 'has username set correctly' do
		user = User.new username: "pekka"

		user.username.should == "pekka"
	end
end
