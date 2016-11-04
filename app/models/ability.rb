class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    user.role ||=Role.new
    
    if user.role.name == 'admin'
      can :manage, :all
      can :access, :rails_admin
      can :dashboard      
    end
    if user.role.name == 'cashier'
      can :manage, [Sale, Item, Customer]
      can :read, [Waiter, Item, Product, Category]  
      can :access, :rails_admin
      can :dashboard      
    end
    
  end
end
