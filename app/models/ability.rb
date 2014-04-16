class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :member   
        can :manage, Wiki, :user_id => user.id 
    end

    if user.role? :premium
       can :manage, :all
    end
   
   end

end
