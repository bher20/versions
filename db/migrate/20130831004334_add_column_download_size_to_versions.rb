class AddColumnDownloadSizeToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :download_size, :string
  end
end
