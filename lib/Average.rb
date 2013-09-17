module Average
	def average_rating
		self.ratings.map{|rating| rating.score}.reduce(:+).to_f / self.ratings.count
	end
end