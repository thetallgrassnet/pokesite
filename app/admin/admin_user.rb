ActiveAdmin.register AdminUser do
  permit_params :name, :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :superuser
    column :created_at
    column :sign_in_count
    column :current_sign_in_at
    actions
  end

  filter :name
  filter :email
  filter :superuser
  filter :created_at
  filter :sign_in_count
  filter :current_sign_in_at

  show do
    attributes_table do
      row :email
      row :superuser
      row :created_at
      row :updated_at
      row :current_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_at
      row :last_sign_in_ip
      row :reset_password_sent_at
    end

    active_admin_comments
  end

  sidebar "Columns", only: :show do
    ul do
      admin_user.article_columns.each do |column|
        li link_to(column, admin_article_column_path(column))
      end
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
