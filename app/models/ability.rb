class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all
		elsif user.role? :logged_in
			can :create, [Recipe, Comment]
		else
			can :read, [Recipe, Comment]	
    end

  end
end
