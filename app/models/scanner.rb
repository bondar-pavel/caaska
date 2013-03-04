require 'net/ssh'
require 'socket'
require 'timeout'

class Scanner

  def self.ping(ip)
    begin
      Timeout.timeout(5) do
        s = TCPSocket.new(ip, 'echo')
        s.close
        return true
      end
    rescue Errno::ECONNREFUSED
      return true
    rescue Timeout::Error
      return false
    rescue Exception => e
      e.message
    end
  end

end
