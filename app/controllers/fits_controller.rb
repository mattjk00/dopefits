class FitsController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "admin123", except: [:index, :show]

	def new
		@fit = Fit.new
	end
	
	def index
		@fit = Fit.all
	end
	
	def create
		@fit = Fit.new(fit_params)
		if @fit.save
			redirect_to @fit
		else
			render 'new'
		end
	end
	
	def show
		@fit = Fit.find(params[:id])
	end
	
	def destroy
		
		@fit = Fit.find(params[:id])
		@fit.delete
		redirect_to fits_path
	end
	
	private
		def fit_params
			params.require(:fit).permit(:title, :imageurl, :description)
		end
end
