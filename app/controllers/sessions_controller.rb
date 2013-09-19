class SessionsController < ApplicationController
	before_action :set_user, only:[:create] 

	def new
	end

	def create
		name = params[:username]
		if (@user.nil?)
			redirect_to :back, notice: "User with name #{name} does not exists"
		else
			session[:user_id] = @user.id if not @user.nil?
			redirect_to user_path(@user), notice: "Welcome back #{name}"
		end
	end

	def destroy
		reset_session
		redirect_to :root, notice: "You have succesfully logged out"
	end

	private
	def set_user
		@user = User.find_by_username params[:username]
	end
end