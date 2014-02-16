class PlacesController < ApplicationController
	before_action :set_place, only:[:show]

	def index
	end
	def search
		city = params[:city]
		session[:city] = city
		@places = BeermappingApi.places_in city
		if @places.empty?
			redirect_to places_path, notice: "No locations found in #{city}"
		else
			render :index
		end
	end

	def show

	end

	private
	def set_place
		@place = BeermappingApi.find_by_id_and_city params[:id], session[:city]
	end
end
