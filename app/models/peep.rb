require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :title, String
  property :created_at, DateTime
  property :message, Text
end


require 'dm-validations'
