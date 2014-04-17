class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :member   
        can :manage, Wiki, :user_id => user.id 
        can :read, Wiki, :private => false
    end

    if user.role? :premium
       can :manage, Wiki, :user_id => user.id
       can :read, Wiki
    end
   
   end

end
