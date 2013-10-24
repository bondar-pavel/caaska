require 'net/ssh'

class Guesser 
# 
#   For now just placeholder, should be completely reworked.
#
   def check_credential(unit, creds)
       if creds.respond_to?(password) and creds.respond_to?(username)
            username = creds.username
            password = creds.password
       else
            return false
       end

       if (Device.respond_to?(ip) and not username.blank?)
           begin
               Net::SSH.start( unit.ip, username, :password => password) do|ssh|
	          # nothing to do for now
               end
               'Successfully authenticated'
           rescue Net::SSH::AuthenticationFailed => e
               "Invalid Credentials: #{e}"
           rescue Net::SSH::SocketError => e
               "Invalid Host: #{e}"
           end
       end
   end

   def check_unit(unit)
      if unit.respond_to?(password) and unit.respond_to?(username)
         check_credential(unit, unit)
      else 
         false
      end
   end

end
