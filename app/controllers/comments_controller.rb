class CommentsController < ApplicationController
	
	def create
		@fit = Fit.find(params[:fit_id])
		
		if session[:current_user_id] != nil
			@comment = @fit.comments.create(comment_params)
			@comment.update_attributes(:poster =>  session[:current_user_id])
			redirect_to fit_path(@fit)
		else
			flash[:notice] = "You need an account in order to comment"
			redirect_to fit_path(@fit)
		end
	end
	
	def destroy
		@fit = Fit.find(params[:fit_id])
		@comment = @fit.comments.find(params[:id])
		@comment.destroy
		redirect_to fit_path(@fit)
	end
	
	private
    def comment_params
      params.require(:comment).permit(:user, :body)
    end
end
