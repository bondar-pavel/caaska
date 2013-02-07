class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :tools, :name, :unique => true
  end
end
