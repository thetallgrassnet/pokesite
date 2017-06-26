class EventPolicy < ApplicationPolicy
  def create?
    user.superuser?
  end

  def update?
    user.superuser?
  end

  def destroy?
    user.superuser?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
