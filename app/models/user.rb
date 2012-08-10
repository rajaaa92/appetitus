class User < ActiveRecord::Base
  has_many :comments
  has_many :recipes
  has_many :cookbooks
  validates_uniqueness_of :name 
	validates_confirmation_of :pass, :on => :create 
	validates_length_of :pass, :within => 5..40
	# If a user matching the credentials is found, returns the User object.
    # If no matching user is found, returns nil.
      def self.authenticate(user_info)
      find_by_name_and_pass(user_info[:name],
                      user_info[:pass])
    end
end
