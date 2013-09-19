class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :ratings, dependent: :destroy
	has_many :raters, through: :ratings, source: :user
	
	validates :name, presence: true

	include Average

	def to_s
		"#{name} #{brewery.name}"
	end
end
