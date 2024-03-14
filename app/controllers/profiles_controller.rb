class ProfilesController < ApplicationController

	def new
		byebug
		@profiles = current_user.build_profile
		byebug
	end

	def create
		byebug
		@profiles = Profile.new(profile_params)

		if @profiles.save
			redirect_to @profiles
		else	
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		byebug
		@profiles = current_user.profile || current_user.build_profile
	end

  	def update
    	@profiles = current_user.profile || current_user.build_profile
    	if @profile.update(name: params[:profile][:name], bio: params[:profile][:bio], profile_picture: params[:profile][:profile_picture])
      		redirect_to root_path, notice: 'Profile updated successfully'
    	else
      		render :edit
    	end
  	end

  	private

  	def profile_params
  		params.require(:profile).permit(:name, :user_id, :profile_picture, :bio)
  	end	

end
