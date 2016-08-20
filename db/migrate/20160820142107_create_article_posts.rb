class CreateArticlePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :article_posts do |t|
      t.string :headline
      t.string :slug
      t.string :subhead
      t.text :body
      t.datetime :published_at
      t.boolean :featured,  default: false
      t.belongs_to :column, index: true, foreign_key: { to_table: :article_columns }
      t.belongs_to :author, index: true, foreign_key: { to_table: :admin_users }

      t.timestamps
    end
    add_index :article_posts, :slug, unique: true
  end
end
