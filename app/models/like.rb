class Like < ActiveRecord::Base
  attr_accessible :recipe_id, :user_id
  validates_presence_of :user_id, :recipe_id 

end

