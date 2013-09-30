module Average
	def average_rating &proc
		return average self.ratings, :score if not block_given?
		ratings.group_by(&proc).to_a.sort_by{|s| average(s[1], :score)}.last[0]
	end
	def average collection, key = nil
		collection.map{|v| key.nil? ? v : v[key]}.reduce(:+).to_f / collection.count
	end

	
end