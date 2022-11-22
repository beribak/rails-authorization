class RestaurantPolicy < ApplicationPolicy
  
  def show?  
    true
  end

  def index?  
    true
  end

  def create?  
    true
  end

  def edit?  
    update?
  end

  def update?  
    record.user == user
  end


  def new?  
    true
  end


  def destroy?  
    record.user == user
  end
  
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def resolve
      scope.all # If users can see all restaurants
      # scope.where(user: user) # If users can only see their restaurants
      # scope.where("name LIKE 't%'") # If users can only see restaurants starting with `t`
      # ...
    end
  end
end
