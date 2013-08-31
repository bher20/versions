class AddColumnDownloadTypeToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :download_type, :string
  end
end
