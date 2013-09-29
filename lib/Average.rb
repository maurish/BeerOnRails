module Average
	def average_rating
		average self.ratings, :score
	end
	def average collection, key = nil
		collection.map{|v| key.nil? ? v : v[key]}.reduce(:+).to_f / collection.count
	end
end