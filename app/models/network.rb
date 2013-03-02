require 'resolv'

class Network < ActiveRecord::Base
  attr_accessible :end_ip, :start_ip  
  validates :end_ip, :presence => true,
            :uniqueness => true, :format => { :with => Resolv::IPv4::Regex } 
  validates :start_ip, :presence => true, 
            :uniqueness => true, :format => { :with => Resolv::IPv4::Regex }

  def self.validate_ip(ip)
      if(Resolv::IPv4::Regex.match(ip))
          [$1.to_i, $2.to_i, $3.to_i, $4.to_i]
      end
  end

  def self.ip2num(ip)
      if(i = self.validate_ip(ip))
          i[0]*2**24 + i[1]*2**16 +i[2]*2**8 + i[3]
      end
  end

  def self.num2ip(num)
      a = num / 2**24 
      num = num % 2**24
      b = num / 2**16
      num = num % 2**16
      c = num / 2**8
      d = num % 2**8
      "#{a}.#{b}.#{c}.#{d}"
  end
end
