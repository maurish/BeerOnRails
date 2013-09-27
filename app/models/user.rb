class User < ActiveRecord::Base
	has_many :ratings, dependent: :destroy
	has_many :memberships
	has_many :beers , through: :ratings
	has_many :beer_clubs, through: :memberships

	has_secure_password

	validates :username, uniqueness: true, length: {minimum: 3, maximum: 15}
	validates :password, length:{minimum: 4}, format: {with: /[^A-Za-z]/, message: "Password must contain atleast 1 non-letter character"}
	


	include Average

	def favorite_beer
		return nil if ratings.empty?
		ratings.sort_by{|r| -r.score}.first.beer
	end

	def favorite_style
		return nil if ratings.empty?
		ratings.map{|r| style:r.beer.style, score:r.score}.reduce({}){|mem, item| }
	end

	def to_s
		"#{username}"
	end
end
