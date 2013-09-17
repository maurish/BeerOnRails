class SessionsController < ApplicationController

	def new
	end

	def create
		set_user
		session[:user_id] = @user.id if not @user.nil?
		redirect_to user_path(@user)
	end

	def destroy
		reset_session
		redirect_to :root
	end

	private
	def set_user
		@user = User.find_by_username params[:username]
	end
	def user_params
		params.require(:user).permit(:username)
	end
end