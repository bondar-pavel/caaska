class AddUnitToolsIndex < ActiveRecord::Migration
  def up
     UnitTool.delete_all 
     add_index :unit_tools, ["tool_id", "unit_id"], :unique => true
  end

  def down
     remove_index :unit_tools, :name => "unit_tools_tool_id_unit_id_index"
  end
end
