class SessionController < ApplicationController

	def new
		@user = Session.new
	end
	
	def create
		@user = User.new(user_params)
		@check_user = User.find_by(name: @user.name)
		
		if @user.password = @check_user.password
			session[:current_user_id] = @user.name
		end
		
		redirect_to fits_path
	end
end
