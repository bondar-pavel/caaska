class Network < ActiveRecord::Base
  attr_accessible :end_ip, :start_ip

  def self.ip2num(ip = nil)
      ip
  end

  def self.num2ip(num = nil)
      num
  end
end
