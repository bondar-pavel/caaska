class UnitTool < ActiveRecord::Base
  attr_accessible :path, :tool_id, :unit_id
  belongs_to :unit
  belongs_to :tool
end
