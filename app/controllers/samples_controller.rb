class SamplesController < ApplicationController
	skip_forgery_protection
	
	def update
		@account = Sample.find(params[:id])
		if @account.present?
			@account.update(sample_params)
			render json: @account, status: :ok
		else
			render json: { errors: 'Account does not exist' }, status: :unprocessable_entity	
		end
	end

	def create
		@account = Sample.new(sample_params)
		if @account.save
			DailyStatusMailer.send_daily_status(@account.fullname).deliver_now
			render json: @account, status: :created
	    else
	        render json: {errors: 'something went wrong'},
	          status: :unprocessable_entity
	    end    	
	end

	private
	def sample_params
		params.permit(:fullname, :first_name, :last_name, :id)
	end
end
