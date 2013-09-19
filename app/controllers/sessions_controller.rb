class SessionsController < ApplicationController
	before_action :set_user, only:[:create] 

	def new
		@user = User.new
	end

	def create
		if @user.nil? or not @user.authenticate "password"
			redirect_to :back, alert: "Username or password Incorrect"
		else
			session[:user_id] = @user.id if not @user.nil?
			redirect_to user_path(@user), notice: "Welcome back #{@user.username}"
		end
	end

	def destroy
		reset_session
		redirect_to :root, notice: "You have succesfully logged out"
	end

	private
	def user_params
		params.require(:user).permit(:username, :password)
	end

	def set_user
		@user = User.find_by_username user_params[:username]
	end
end