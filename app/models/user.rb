class User < ActiveRecord::Base
	def to_s
		self.username
	end
end
