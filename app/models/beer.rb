require "#{Rails.root}/lib/Average.rb"
class Beer < ActiveRecord::Base
	belongs_to :brewery
	belongs_to :style
	has_many :ratings, dependent: :destroy
	has_many :raters, through: :ratings, source: :user

	validates :name, :style, presence: true

	include Average

	def to_s
		"#{name} #{brewery.name}"
	end
end
