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
