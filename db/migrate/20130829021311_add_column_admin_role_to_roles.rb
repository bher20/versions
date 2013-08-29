class AddColumnAdminRoleToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :admin_role, :boolean
  end
end
