class UserActivityJob < ApplicationJob
  queue_as :default

  def perform
  	time_schl = Time.now.beginning_of_day + 10.hours + 13.minutes
    Sample.where(status: 'active').where('updated_at <= ?', time_schl.strftime("%F %H:%M:%S")).find_each do |user|
      user.update(status: 'expired')
    end
  end
end