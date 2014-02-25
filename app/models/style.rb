class Style < ActiveRecord::Base
	has_many :beers
	validates :name, uniqueness: true

	def to_s
		"#{name}"
	end
end
