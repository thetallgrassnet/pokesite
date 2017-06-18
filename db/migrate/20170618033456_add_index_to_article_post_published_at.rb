class AddIndexToArticlePostPublishedAt < ActiveRecord::Migration[5.1]
  def change
    add_index :article_posts, :published_at, order: { published_at: "DESC NULLS LAST" }
  end
end
