class ChangeChangeLogTypeToLongtextInVersions < ActiveRecord::Migration
  def up
    change_column :versions, :change_log, :longtext
  end

  def down
    change_column :versions, :change_log, :varchar
  end
end
