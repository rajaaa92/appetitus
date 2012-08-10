class Recipe < ActiveRecord::Base
  has_many :comments
  has_many :cookbooks
  belongs_to :user

  validates_presence_of :name
# Name	Content	Rate	User

end

