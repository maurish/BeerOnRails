require 'spec_helper'

describe Beer do
  describe 'beer is not generated without' do 
  	it 'name' do 
  		beer = Beer.create style: "Lager"
  		expect(beer.valid?).to eq false
  		expect(Beer.count).to eq 0
  	end

  	it 'style' do 
  		beer = Beer.create name: "kalja"
  		expect(beer.valid?).to eq false
  		expect(Beer.count).to eq 0
  	end
  end
end
