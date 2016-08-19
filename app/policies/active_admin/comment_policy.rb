module ActiveAdmin
  class CommentPolicy < ApplicationPolicy
    class Scope < ApplicationPolicy::Scope
      def resolve
        scope
      end
    end
  end
end
