require 'resolv'

class Device < ActiveRecord::Base
  attr_accessible :ip, :network_id, :ping, :ssh
  belongs_to :network
  validates :ip, :presence => true, :uniqueness =>true,
            :format => { :with => Resolv::IPv4::Regex }
end
