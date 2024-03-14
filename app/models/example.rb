class Example < ApplicationRecord
	validate :age_given
	# before_save :age_given

	def age_given
		if self.age>=10
			p "ok"
		else
			errors.add(:age, "must greater than 10")
		end		
	end
end
