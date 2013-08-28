class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :version
      t.string :change_log
      t.text :comment

      t.timestamps
    end
  end
end
