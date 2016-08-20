class Article::PostPolicy < ApplicationPolicy
  def create?
    user.superuser? or user.article_columns.include?(record.column)
  end

  def update?
    user.superuser? or record.author == user
  end

  def destroy?
    user.superuser? or record.author == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
