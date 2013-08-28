class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.text :comment
      t.string :guid

      t.timestamps
    end
  end
end