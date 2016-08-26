class AddFeaturedImageToArticlePosts < ActiveRecord::Migration[5.0]
  def change
    add_column :article_posts, :featured_image, :string
  end
end
