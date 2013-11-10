class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

	has_many :comments
  has_many :recipes

  def name
    self.email.split("@").first
  end

end
