module ActiveAdmin
  class PagePolicy < ApplicationPolicy
    def show?
      true
    end

    class Scope < ApplicationPolicy::Scope
      def resolve
        scope
      end
    end
  end
end
