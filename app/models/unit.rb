class Unit < ActiveRecord::Base
  attr_accessible :description, :ip, :password, :unit_id, :username
  validates :ip, :presence => true, :uniqueness =>true

  def check_credential                                                                                                                         
   if (!self.ip.blank?)                                                                                                   
#     require 'net/ssh'
     begin
       require 'net/ssh'
       Net::SSH.start( self.ip, self.username, :password => self.password) do|ssh|
       
       end
       'Successfully authenticated'
#     rescue Net::SSH::AuthenticationFailed => e
#       "Invalid Credentials: #{e}"
#     rescue Net::SSH::SocketError => e
#       "Invalid Host: #{e}"
     rescue
       "Unknown error: #{e}"
     end
   else
     "Ip #{self.ip} is blank"
   end
  end
end
