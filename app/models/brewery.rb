class Brewery < ActiveRecord::Base
	has_many :beers, dependent: :destroy
	has_many :ratings, through: :beers

	include Average
	
	def to_s
		"#{name} :#{year}"
	end
end
