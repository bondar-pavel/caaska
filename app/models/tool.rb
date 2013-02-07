class Tool < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :unit_tools
  validates :name, :presence => true, :uniqueness =>true

end
