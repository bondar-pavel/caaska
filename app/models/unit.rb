class Unit < ActiveRecord::Base
  attr_accessible :description, :ip, :password, :unit_id, :username
  has_many :unit_tools, :dependent => :destroy
  validates :ip, :presence => true, :uniqueness =>true

  def check_tool(tool)
    if(!tool.nil? and !tool.name.blank?)
      begin
         require 'net/ssh'
         result = 'nothing'
         Net::SSH.start( self.ip, self.username, :password => self.password) do|ssh|
           result = ssh.exec!("which #{tool.name}")
         end
         t = UnitTool.new
         t.unit = self
         t.tool = tool
         t.path = result
         t.save!
         result +' Fine!'
      rescue Exception => e 
	 e.message
      end
    end
  end

  def check_tools
     tools = Tool.find(:all)
     tools.each do |t|
       status = self.check_tool(t)
       self.description = self.description + "\n" + status;
     end
     self.save!
  end

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

  def update_description(desc)
     self.description = desc
     self.save!
  end

end
