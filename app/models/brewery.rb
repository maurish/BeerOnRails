class Brewery < ActiveRecord::Base
	has_many :beers, dependent: :destroy

	def to_s
		"#{name} :#{year}"
	end
end
