class CreateUnitTools < ActiveRecord::Migration
  def change
    create_table :unit_tools do |t|
      t.integer :unit_id
      t.integer :tool_id
      t.string :path

      t.timestamps
    end
  end
end
