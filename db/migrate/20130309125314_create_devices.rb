class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :ip
      t.boolean :ping
      t.boolean :ssh
      t.integer :network_id

      t.timestamps
    end
  end
end
