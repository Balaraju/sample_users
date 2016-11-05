class User < ActiveRecord::Base
	
	def self.all_roles
		pluck(:role)
	end

end
