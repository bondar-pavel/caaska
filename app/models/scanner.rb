require 'net/ssh'
require 'socket'
require 'timeout'

class Scanner

  def self.ping(ip)
    begin
      Timeout.timeout(2) do
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

  def self.ping_each(ips) 
    devices = Array.new
    ips.each do |ip|
       devices << ip if self.ping(ip)
    end
    devices
  end
end
