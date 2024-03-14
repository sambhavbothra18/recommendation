class DailyStatusMailer < ApplicationMailer
	def send_daily_status(email_address)
		
	    @user = email_address
	    mail(to: @user, subject: "Your Daily Status Email")
  	end	
end
