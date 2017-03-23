class Article::PostsController < ApplicationController
  def index
    @posts = Article::Post.published.page params[:page]
  end

  def show
    @post = Article::Post.published.friendly.find params[:id]
    @latest_posts = Article::Post.published.limit 5
    @latest_in_col = @post.column.posts.published.limit 5
  end
end
