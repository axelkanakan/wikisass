class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :member   
        can :manage, Wiki, :user_id => user.id 
        can :read, Wiki, :private => false
        can :destroy, Wiki, :user_id => user.id
    end

    if user.role? :premium
       can :manage, Wiki, :user_id => user.id
       can :read, Wiki
       can [:edit, :update], Wiki do |wiki| 
          user.wikis_editable_by_user.include?(wiki)
        end
    end
   

   
   end

end
