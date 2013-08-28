class AddApplicationIdToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :application_id, :integer
  end
end
