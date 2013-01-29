# Load the rails application
require File.expand_path('../application', __FILE__)

# add net::ssh gem
#Rails::Initializer.run do |config|
#  config.gem 'net-ssh', :lib => "net/ssh" 
#end

# Initialize the rails application
Caaska::Application.initialize!
