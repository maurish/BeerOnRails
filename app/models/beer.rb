class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :ratings
	def average_rating
		self.ratings.map{|rating| rating.score}.reduce(:+).to_f / self.ratings.count
	end
end
