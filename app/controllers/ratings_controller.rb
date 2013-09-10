class RatingsController < ApplicationController
	before_action :set_rating, only: [:destroy]

	def index
		@ratings = Rating.all
	end
	def new 
		@beers = Beer.all
		@rating = Rating.new
	end

	def create 
		@rating = Rating.create(rating_params)
		if @rating.save
			redirect_to ratings_path
		end
	end

	def destroy
		@rating.destroy
		redirect_to ratings_path
	end
	
	private
	def set_rating
		@rating = Rating.find(params[:id])
	end

	def rating_params
		params.require(:rating).permit(:score,:beer_id)
	end
end