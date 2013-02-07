class RemoveFieldNameFromUnits < ActiveRecord::Migration
  def up
    remove_column :units, :unit_id
  end

  def down
    add_column :units, :unit_id, :integer
  end
end
