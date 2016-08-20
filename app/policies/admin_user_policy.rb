class AdminUserPolicy < ApplicationPolicy
  def create?
    user.superuser?
  end

  def update?
    user.superuser?
  end

  def destroy?
    user.superuser? and not record == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
