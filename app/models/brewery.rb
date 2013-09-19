class Brewery < ActiveRecord::Base
	has_many :beers, dependent: :destroy
	has_many :ratings, through: :beers

	validates :name,:year,  presence: true
	validates :year, numericality: true
	validate :prevent_future

	include Average
	
	def prevent_future
		errors.add :year,  "Founding year can't be in the future!" if Time.now.year < year	or year < 1042
	end


	def to_s
		"#{name} :#{year}"
	end
end
