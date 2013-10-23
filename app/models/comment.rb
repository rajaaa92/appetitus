class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :recipe_id
  belongs_to :recipe
  belongs_to :user
  validates_presence_of :recipe_id, :user_id, :content
end
