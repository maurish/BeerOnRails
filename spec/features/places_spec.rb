require 'spec_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    BeermappingApi.stub(:places_in).with("kumpula").and_return(
        [ Place.new(:name => "Oljenkorsi") ]
    )
    visit_and_search 'kumpula'

    expect(page).to have_content "Oljenkorsi"
  end
  it 'if multiple returned by the API, each is shown at page' do
  	BeermappingApi.stub(:places_in).with('Helsinki').and_return (
  		[
  			Place.new(:name => 'Oljenkorsi'),
  			Place.new(:name => 'Hilpeä Hauki'),
  			Place.new(:name => 'William K')
  		]
  	)
  	visit_and_search 'Helsinki'

  	expect(page).to have_content 'Oljenkorsi'
  	expect(page).to have_content 'Hilpeä Hauki'
  	expect(page).to have_content 'William K'
  end

  it 'if none found, page contains error msg' do
  	BeermappingApi.stub(:places_in).with('nosuchplace').and_return([])
  	visit_and_search 'nosuchplace'
  	expect(page).to have_content 'No locations found in nosuchplace'
  end
  def visit_and_search city
  	visit places_path
  	fill_in('city', with:city)
  	click_button 'Search'
  end
end


