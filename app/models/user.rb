class User < ActiveRecord::Base
	has_many :ratings, dependent: :destroy
	has_many :memberships
	has_many :beers , through: :ratings
	has_many :beer_clubs, through: :memberships

	has_secure_password

	validates :username, uniqueness: true, length: {minimum: 3, maximum: 15}
	validates :password, length:{minimum: 4}, format: {with: /[^A-Za-z]/, message: "Password must contain atleast 1 non-letter character"}
	


	include Average

	def favorite &block
		return nil if ratings.empty?
		average_rating(&block)
	end

	
	def favorite_beer
		favorite {|r| r.beer}
	end

	def favorite_style
		favorite {|r| r.beer.style}
	end

	def favorite_brewery
		favorite {|r| r.beer.brewery}
	end

	def to_s
		"#{username}"
	end
end
