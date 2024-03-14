namespace :daily do
  desc "Send daily status email"
  task :send_email => :environment do
    email_address = "samphe68@gmail.com"
    DailyStatusMailer.send_daily_status(email_address).deliver_now
  end
end