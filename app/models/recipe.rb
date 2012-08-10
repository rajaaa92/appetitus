class Recipe < ActiveRecord::Base
  attr_accessible :name, :ingredients, :content, :rate, :user_id

end

