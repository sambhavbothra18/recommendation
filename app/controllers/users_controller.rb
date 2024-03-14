class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		@user = User.new(user_params)
		existing_account = User.find_by(email: @user.email)
          if existing_account
            render json: { error: 'An account is already registered with this email address.' }, status: :conflict
            return
          end
          if @user.save
          		redirect_to rooms_path
          	else
          		render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
          end	
	end

	def show
	    @user = User.find(params[:id])
	    @current_user = current_user
	    @rooms = Room.public_rooms
	    @users = User.all_except(@current_user)
	    @room = Room.new
	    @message = Message.new
	    @room_name = get_name(@user, @current_user)
	    @single_room = Room.where(room_name: @room_name).first || Room.create_private_room([@user, @current_user], @room_name)
	    @messages = @single_room.messages

	    render "rooms/index"
  	end

  	private
  	
  	def user_params
  		params.permit(:name, :email, :password)
  	end
 	def get_name(user1, user2)
	    users = [user1, user2].sort
	    "private_#{users[0].name}_#{users[1].name}"
  	end
end
