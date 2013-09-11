class StaticpagesController < ApplicationController
  def home
  	if user_signed_in?
  		@user = current_user
  		redirect_to show_user_path(@user.id)
  	end
  end
end
