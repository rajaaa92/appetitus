class Recipe < ActiveRecord::Base
  attr_accessible :name, :ingredients, :content, :rate, :user_id
  validates_presence_of :name, :ingredients
  has_many :comments, :dependent => :destroy
  belongs_to :user
end

