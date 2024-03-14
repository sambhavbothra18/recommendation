class Sample < ApplicationRecord
	# before_save :set_name
	# include ActiveModel::Dirty
	# attr_accessor :fullname, :first_name, :last_name
	# define_attribute_methods :fullname
	enum status: [ :active, :inactive, :expired ]
has_paper_trail
	def set_name
		if self.fullname.present? 
			if self.fullname.split.count>1
				countword = self.fullname.split.count
				names = fullname.split(" ")
				self.first_name=names[0...countword-1].join(' ')
				self.last_name = names[countword-1]
			else	
				self.first_name = self.fullname.strip.capitalize
			end
		elsif self.first_name.present? || self.last_name.present?
			self.fullname = [self.first_name.strip.capitalize, self.last_name.strip.capitalize].join(' ')	
		end
	end

	def track_fullname
		
		if fullname_previously_changed?
			puts "Fullname is changed from #{fullname_previous_change.first} to #{fullname}"
		else
			puts "Fullname is not changed"	
		end	
	end
end

