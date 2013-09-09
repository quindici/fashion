class UserController < ApplicationController
	def show
		# check if the requested user to shown is current user
		# if so, pass more information
		@user = User.find(params[:id])
		@look_item = @user.looks.paginate(page: params[:page])
	end

end
