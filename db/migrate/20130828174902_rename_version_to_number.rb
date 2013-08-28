class RenameVersionToNumber < ActiveRecord::Migration
  def up
    rename_column :versions, :version, :number
  end

  def down
    rename_column :versions, :number, :version
  end
end
