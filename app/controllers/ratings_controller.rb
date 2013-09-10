class RatingsController < ApplicationController
	before_action :set_rating, only: []
	def index
		@ratings = Rating.all
	end
	private
	def set_rating
		@rating = Rating.find(params[:id])
	end
	def beer_params
		params.require(:beer).permit(:score,:beer_id)
	end
end