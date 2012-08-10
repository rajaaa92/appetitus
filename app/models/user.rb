class User < ActiveRecord::Base
  has_many :comments
  has_many :recipes
  has_many :cookbooks
  attr_accessible :name, :pass
	# If a user matching the credentials is found, returns the User object.
    # If no matching user is found, returns nil.
      
end
