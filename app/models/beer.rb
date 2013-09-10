class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :ratings, dependent: :destroy
	def average_rating
		self.ratings.map{|rating| rating.score}.reduce(:+).to_f / self.ratings.count
	end

	def to_s
		"#{name} #{brewery.name}"
	end
end
