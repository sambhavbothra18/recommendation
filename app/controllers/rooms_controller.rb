class RoomsController < ApplicationController
	# before_action :authenticate_user!

	def index
		@current_user = current_user
		redirect_to '/signin' unless @current_user

		@rooms = Room.public_rooms	
		@room = Room.new
		@users = User.all_except(@current_user) 
	end

	def create
		@room = Room.create(room_name: params["room"]["room_name"])
	end

	def show
		@current_user = current_user
		@rooms = Room.public_rooms
	  	@users = User.all_except(@current_user)
	  	@room = Room.new
	  	@single_room = Room.find(params[:id])
	  	@message = Message.new
	  	@messages = @single_room.messages.order(created_at: :asc)

	  	render "index"
	end
end
