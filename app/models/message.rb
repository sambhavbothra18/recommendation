class Message < ApplicationRecord
  has_noticed_notifications

  belongs_to :user
  belongs_to :room

  before_create :confirm_participant 
  after_create_commit { broadcast_append_to self.room }
  # after_create_commit :send_notification
  after_create_commit :notify_user

  def confirm_participant
    if self.room.is_private
      is_participant = Participant.where(user_id: self.user.id, room_id: self.room.id).first
      throw :abort unless is_participant
    end
  end

  private

  def notify_user
    pa=Participant.where.not(user_id: user_id).where(room_id: room_id)

    pa.map(&:user).each do |user|
      MessageNotification.with(message: self).deliver_later(user)
    end 
  end
  # def send_notification
  #   recipient_users = room.users.where.not(id: user_id)
  #   recipient_users.each do |recipient|
  #     Notification.with(message: self).deliver(recipient)
  #   end
  # end
end
