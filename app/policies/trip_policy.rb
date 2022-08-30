class TripPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(address: address, sport: sport, start_date: stard_date, end_date: end_date)
    end
  end
end
