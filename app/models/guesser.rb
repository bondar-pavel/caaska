require 'net/ssh'

class Guesser 
# 
#   For now just placeholder, should be completely reworked.
#
   def check_credential(unit, creds)
       if (creds.nil?)
            if Device.restond_to?(password) and Device.repond_to?(usename)
               username = unit.username;
               password = unit.password;
            end
       else
            username = creds.usename;
            password = creds.password;
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

end
