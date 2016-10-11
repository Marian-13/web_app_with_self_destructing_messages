class User
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  include DataMapper::Resource

  property :id,       Serial # An auto-increment integer key
  property :name,     String, required: true, length: 2..25
  property :email,    String, required: true, format: EMAIL_REGEX, unique: true
  property :password, String, required: true, length: 6..25
end

DataMapper.finalize
# DataMapper.auto_upgrade!
