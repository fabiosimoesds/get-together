class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
     def resolve
       scope.all
     end
    # def resolve
    #   scope.where(user: user)
    # end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end
end
