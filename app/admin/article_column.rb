ActiveAdmin.register Article::Column do
  menu parent: 'Articles', label: 'Columns'
  permit_params :name, :description, author_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  sidebar 'Authors', only: :show do
    ul do
      article_column.authors.each do |author|
        li link_to(author, admin_admin_user_path(author))
      end
    end
  end

  form do |f|
    f.inputs "Column Details" do
      f.input :name
      f.input :description
      f.input :authors, as: :select, collection: AdminUser.all
    end
    f.actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
