class TripPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.where(user: user)
    # end
  end

  def index?
    true
  end

  def show?
    true
  end
end
