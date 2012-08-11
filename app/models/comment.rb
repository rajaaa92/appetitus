class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :recipe_id
  belongs_to :recipe
  belongs_to :user
end
