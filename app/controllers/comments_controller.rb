class CommentsController < ApplicationController
	
	def create
		@fit = Fit.find(params[:fit_id])
		@comment = @fit.comments.create(comment_params)
		
		@comment.update_attributes(:poster =>  session[:current_user_id])
		redirect_to fit_path(@fit)
	end
	
	private
    def comment_params
      params.require(:comment).permit(:user, :body)
    end
end
