class EditorImagePolicy < ApplicationPolicy
  def create?
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
