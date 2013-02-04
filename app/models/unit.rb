class Unit < ActiveRecord::Base
  attr_accessible :description, :ip, :password, :unit_id, :username
  validates :ip, :presence => true, :uniqueness =>true

  def check_credential                                                                                                                         
   if (!self.ip.blank?)                                                                                       
     begin
       require 'net/ssh'
       Net::SSH.start( self.ip, self.username, :password => self.password) do|ssh|
         ssh.exec('ls')
       end
       'Successfully authenticated'
     rescue Net::SSH::AuthenticationFailed => e
       "Invalid Credentials: #{e}"
     rescue SocketError => e
       "Invalid Host: #{e}"
     rescue Exception => e  
        e.message  
     end
   else
     "Ip is blank"
   end
  end

  def update_description
     self.description = self.check_credential
     self.save!
  end

end
