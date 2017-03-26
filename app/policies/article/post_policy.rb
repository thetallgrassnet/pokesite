class Article::PostPolicy < ApplicationPolicy
  def create?
    user.superuser? or
      (record and user.article_columns.include?(record.column)) or
      (user.article_columns.any? and not record)
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
