class Style < ActiveRecord::Base
	has_many :beers
	validates :title, uniqueness: true

	def to_s
		"#{title}"
	end
end
