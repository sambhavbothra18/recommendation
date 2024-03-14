class NotificationsController < ApplicationController
	# before_action :authenticate_user!

	# def index
	# 	@notifications = current_user.notifications.order(created_at: :desc)
	#     current_user.notifications.unread.update_all(read_at: Time.current)
	# end

	def index
		# @notifications = Notification.where(recipient: current_user)
		@notifications = Notification.where(recipient: current_user)
	end

	# def mark_as_read
	#     @notifications = Notification.where(recipient: current_user).unread
	#     @notifications.update_all(read_at: Time.zone.now)
	#     render json: {success: true}
	# end
end
