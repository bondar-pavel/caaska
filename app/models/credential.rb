class Credential < ActiveRecord::Base
  attr_accessible :count, :password, :username
end
