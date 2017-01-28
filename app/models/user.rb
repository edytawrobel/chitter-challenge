require 'bcrypt'
require 'dm-validations'
require './app/datamapper_setup'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :email, String, :format => :email_address, required: true, unique: true
  property :user_name, String
  property :password_digest, Text

end
