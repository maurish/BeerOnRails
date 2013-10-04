class RatingsController < ApplicationController
	before_action :set_rating, only: [:destroy]
	before_action :ensure_that_signed_in, except:[:index]

	def index
		@ratings = Rating.all
	end
	def new 
		@beers = Beer.all
		@rating = Rating.new
	end

	def create 
		return redirect_to :back, notice: "You need to be logged in to rate" if current_user.nil? 
		@rating = Rating.create(rating_params)
		current_user.ratings << @rating 
		session[:last_rating] = "#{@rating.beer} #{@rating.score} points"
		if @rating.save
			redirect_to ratings_path
		else
			@beers = Beer.all
			render :new
		end
	end

	def destroy
		if currently_signed_in? @rating.user
			@rating.destroy
			redirect_to :back, notice: "Rating successfully destroyed"	
		else
			redirect_to :back, notice:"You can only delete ratings made by you"	
		end
		
	end
	
	private
	def set_rating
		@rating = Rating.find(params[:id])
	end

	def rating_params
		params.require(:rating).permit(:score,:beer_id)
	end
end