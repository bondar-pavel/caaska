class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :start_ip
      t.string :end_ip

      t.timestamps
    end
  end
end
