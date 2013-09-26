class User < ActiveRecord::Base
	has_many :ratings, dependent: :destroy
	has_many :memberships
	has_many :beers , through: :ratings
	has_many :beer_clubs, through: :memberships

	has_secure_password

	validates :username, uniqueness: true, length: {minimum: 3, maximum: 15}
	validates :password, length:{minimum: 4}, format: {with: /[^A-Za-z]/, message: "Password must contain atleast 1 non-letter character"}
	


	include Average

	def to_s
		"#{username}"
	end
end
