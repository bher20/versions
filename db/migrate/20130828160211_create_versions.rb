class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :number
      t.string :change_log
      t.text :comment

      t.timestamps
    end
  end
end
