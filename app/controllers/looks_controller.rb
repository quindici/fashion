# look_controller.rb
class LooksController < ApplicationController
	def new
		@look = Look.new
		# For the moment I will assign there's only one photo per look
		@look.lookPhotos.build
	end

	def create
		@look = Look.new(look_params)
		@look.user_id = current_user.id
		lp = @look.lookPhotos.build
		if (params[:look].has_key?(:lookPhoto))
			lp.photo = params[:look][:lookPhoto][:photo]
		else
			flash[:fail] = "A photo must be attached to create a look!"
		end

		if @look.save
			# Save successfully..
			flash[:notice] = "Look created successfully"
			redirect_to @look
		else
			# Failed!
			render action: "new"
		end
	end

	def show
		@look = Look.find(params[:id])
	end

	def destroy
		@look  = Look.find(params[:id])
		@user = @look.user
		if @user.id = current_user.id
			@look.destroy
			flash[:success] = "Look deleted successfully"
		else
			flash[:notice] = "Something's wrong"
		end
		redirect_to show_user_path(current_user.id)
	end

	# Below is the todos...
	def edit
		@look = Look.find(params[:id])
	end

	def update
		@look = Look.find(params[:id])
		@look.description = params[:look][:description]

		if current_user.id == @look.user.id && @look.save
			flash[:success] = "Update successfully"
		else
			flash[:notice] = "Something's wrong, you can only edit look owned by you."
		end
		redirect_to show_user_path(current_user.id)
	end

	private
	def look_params
		params.require(:look).permit(:description, :user_id)
	end
end
