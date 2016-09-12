class Article::PostsController < ApplicationController
  def index
    @posts = Article::Post.published
  end

  def show
    @post = Article::Post.published.friendly.find params[:id]
  end
end
