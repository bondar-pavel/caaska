class Network < ActiveRecord::Base
  attr_accessible :end_ip, :start_ip

  def self.validate_ip(ip)
      if(ip =~ /(\d+)\.(\d+)\.(\d+)\.(\d+)/)
          if($1.to_i<256 && $2.to_i<256 && $3.to_i<256)
              [$1.to_i, $2.to_i, $3.to_i, $4.to_i]
          else
              false
          end
      else
          false
      end
  end

  def self.ip2num(ip)
      if(arr = self.validate_ip(ip))
         arr[0]*2**24 + arr[1]*2**16 + arr[2]*2**8 +arr[3]
      else
         nil
      end
  end

  def self.num2ip(num)
      num 
  end
end
