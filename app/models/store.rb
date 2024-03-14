class Store < ApplicationRecord
	# include ActiveModel::Dirty
	has_secure_password

	# attr_accessor :name

	# def initialize(name)
    # 	@name = name
  	# end
	# def track
	# 	if name_changed?
	# 		puts "from #{name_was} to #{name}"
	# 	else
	# 		puts "Not"	
	# 	end
	# end

	has_paper_trail
	# validate :names

	# def names
	# 	names.include?("")
	# end
end
