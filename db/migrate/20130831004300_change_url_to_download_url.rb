class ChangeUrlToDownloadUrl < ActiveRecord::Migration
  def up
    rename_column :versions, :url, :download_url
  end

  def down
    rename_column :versions, :download_url, :url
  end
end
