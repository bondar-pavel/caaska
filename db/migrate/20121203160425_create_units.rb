class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :unit_id
      t.string :ip
      t.text :description
      t.string :username
      t.string :password

      t.timestamps
    end
    add_index :units, :unit_id, :unique => true
  end
end
