class UsersController < ApplicationController
	def index
		@user = User.all
		@login_user = User.new
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		@user.name = @user.name.delete(" ")
		if @user.save
			session[:current_user_id] = @user.name
			redirect_to fits_path
		else
			render 'new'
		end
	end
	
	def show
		@user = User.find(params[:id])
	end
	
	def signin
		@user = User.new(user_params)
		@check_user = User.find_by(name: @user.name)
		
		if @check_user != nil
			if @user.password == @check_user.password
				session[:current_user_id] = @user.name
				
				redirect_to fits_path
			else
				flash[:notice] = "The username or password is incorrect"
				redirect_to users_path
			end
		else
			flash[:notice] = "The username or password is incorrect"
			redirect_to users_path
		end
		
	end
	
	def logout
		session[:current_user_id] = nil
		
		redirect_to fits_path
	end
	
	private
		def user_params
			params.require(:user).permit(:name, :password)
		end
end
