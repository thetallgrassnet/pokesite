ActiveAdmin.register Article::Post do
  menu parent: 'Articles', label: 'Posts'
  permit_params :headline, :subhead, :body, :published_at, :publish_now, :featured, :column_id

  before_create do |post|
    post.author = current_admin_user
  end

  index do
    selectable_column
    id_column
    column :headline
    column :author
    column :column
    column :created_at
    column :published_at
    column :featured
    actions
  end

  form do |f|
    f.inputs 'Article Details' do
      f.input :headline
      f.input :subhead
      f.input :column, collection: (current_admin_user.superuser? ? Article::Column.all : current_admin_user.article_columns)
      f.input :published_at
      f.input :publish_now, as: :boolean
      f.input :featured
    end
    f.inputs 'Content', :body
    f.actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
