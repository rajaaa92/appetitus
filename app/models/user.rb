class User < ActiveRecord::Base
  attr_accessible :name, :pass
	# If a user matching the credentials is found, returns the User object.
    # If no matching user is found, returns nil.
      
end
