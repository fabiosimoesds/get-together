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
    if record.invitations.empty?
      false
    else
      record.invitations.each do |invitation|
        true if invitation.asker == user || invitation.receiver == user
      end
    end
  end

  def new?
    create?
  end

  def create?
    true
  end
end
