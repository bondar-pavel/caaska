class Device < ActiveRecord::Base
  attr_accessible :ip, :network_id, :ping, :ssh
end
