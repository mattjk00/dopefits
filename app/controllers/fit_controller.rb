class FitController < ApplicationController
	def index
		
	end
	
	def new
		@fit = Fit.New
	end
	
	def create
		@fit = Fit.New(fit_params)
		@fit.save
		redirect_to @fit
	end
	
	private
		def fit_params
			params.require(:fit).permit(:title, :imageurl, :description)
		end
end
