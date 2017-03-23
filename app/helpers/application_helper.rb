module ApplicationHelper
  def columns_with_published_posts
    @columns_with_published_posts ||= Article::Column.with_published_posts
  end
end
