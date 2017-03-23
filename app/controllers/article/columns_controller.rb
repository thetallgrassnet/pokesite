class Article::ColumnsController < ApplicationController
  def show
    @column = Article::Column.friendly.find params[:column_id]
    @posts = @column.posts.published.page params[:page]
    render 'article/posts/index'
  end
end
