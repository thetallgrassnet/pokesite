class WelcomeController < ApplicationController
  def index
    @featured_posts = Article::Post.featured
    @non_featured_posts = Article::Post.published.where.not(id: @featured_posts.pluck(:id)).limit(8)
  end
end
