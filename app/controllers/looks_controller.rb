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

	# Below is the todos...
	def edit
		@look = Look.find(params[:id])
	end

	def update
	end

	private
	def look_params
		params.require(:look).permit(:description, :user_id)
	end
end
