class SessionsController < ApplicationController

  	def create
	    user = User.find_by(email: params[:session][:email])

	    if user && user.authenticate(params[:session][:password])
	      log_in(user)
	    else
	      flash.now[:danger] = 'Invalid email/password combination'
	      render 'new'
	    end
	end

  	def destroy
		log_out if logged_in?
		redirect_to root_path
	end
end
