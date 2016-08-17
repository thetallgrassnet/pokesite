class AddSuperuserToAdminUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :superuser, :boolean
  end
end
