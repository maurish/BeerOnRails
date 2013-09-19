class User < ActiveRecord::Base
	has_many :ratings, dependent: :destroy
	has_many :memberships
	has_many :beers , through: :ratings
	has_many :beer_clubs, through: :memberships

	has_secure_password

	include Average

	def to_s
		self.username
	end
end
