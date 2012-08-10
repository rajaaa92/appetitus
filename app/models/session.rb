class Session < ActiveRecord::Base
	def after_initialize
		if new_record?
			user ||= 10
		end
	end	
end
