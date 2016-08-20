class CreateArticleColumns < ActiveRecord::Migration[5.0]
  def change
    create_table :article_columns do |t|
      t.string :name
      t.string :slug
      t.string :description

      t.timestamps
    end
    add_index :article_columns, :slug, unique: true

    create_table :admin_users_article_columns, id: false do |t|
      t.belongs_to :admin_user, index: true, foreign_key: true
      t.belongs_to :column,     index: true, foreign_key: { to_table: :article_columns }
    end
    add_index :admin_users_article_columns, [:admin_user_id, :column_id],
      name: :index_admin_users_columns_on_user_id_and_column_id, unique: true
  end
end
