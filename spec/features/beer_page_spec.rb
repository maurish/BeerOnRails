require 'spec_helper'

describe 'Beer' do
	let!(:brewery){FactoryGirl.create :brewery, name:"Koff", year:1895}
	let!(:beer1){FactoryGirl.create :beer, name:"Isompi", brewery:brewery}
	let!(:beer2){FactoryGirl.create :beer, name:"Pienempi", brewery:brewery}

	it 'can be added to application' do
		visit new_beer_path
		fill_in 'beer[name]', with:"keskikokoinen"
		select "style1", from:'beer[style_id]'
		select brewery.id, from:'beer[brewery_id]'
		expect {click_button 'Create Beer'}.to change{Beer.count}.by(1)

		expect(page).to have_content 'keskikokoinen'
	end

end
