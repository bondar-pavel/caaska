class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :username
      t.string :password
      t.integer :count

      t.timestamps
    end
  end
end
