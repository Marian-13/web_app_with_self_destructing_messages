class User
  # TODO NAME_REGEX
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  include DataMapper::Resource

  property :id,       Serial # An auto-increment integer key
  property :name,     String, required: true, length: 2..25
  property :email,    String, required: true, format: EMAIL_REGEX, unique: true
  property :password, BCryptHash

  has n, :dialogs
  has n, :messages, throught: :dialogs

  before :save do
    self.name.capitalize!
    self.email.downcase!
  end
end

User.finalize
# DataMapper.finalize
# DataMapper.auto_upgrade!

# DataMapper.auto_migrate!
