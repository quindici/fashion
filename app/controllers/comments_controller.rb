class CommentsController < ApplicationController
	before_action :get_look
	def create
		comment = @look.comments.new(comment_params)
		comment.user_id = current_user.id

		if comment.save
			flash[:success] = "Comment submitted"
			redirect_to @look
		else
			flash[:fail] = "Comment not yet submitted: #{comment.errors.full_messages}"
			redirect_to :back
		end
	end

	def destroy
		comment = Comment.find(params[:id])
		if comment.destroy
			flash[:success] = "Comment deleted"
		else
			flash[:fail] = "Comment not yet deleted: #{comment.errors.full_messages}"
		end
		redirect_to @look
	end

	def get_look
		@look = Look.find(params[:look_id])
	end

	private
	def comment_params
		params.require(:comment).permit(:text)
	end

end
