class User
  include DataMapper::Resource

  property :id,    Serial # An auto-increment integer key
  property :name,  String
  property :email, String
end

DataMapper.finalize
