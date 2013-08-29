class CreateProfilesRoles < ActiveRecord::Migration
  def up
    create_table :profiles_roles, :id => false do |t|
      t.references :profile
      t.references :role
    end
  end

  def down
    drop_table :profiles_roles
  end
end
