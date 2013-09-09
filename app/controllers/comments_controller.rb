class CommentsController < ApplicationController
	def show
		# check if the requested user to shown is current user
		# if so, pass more information
		@user = User.find params[:id]
		@looks = Look.where(user_id: params[:id])
	end
end
