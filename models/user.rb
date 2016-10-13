class User
  # TODO NAME_REGEX
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  include DataMapper::Resource

  property :id,       Serial # An auto-increment integer key
  property :name,     String, required: true, length: 2..25
  property :email,    String, required: true, format: EMAIL_REGEX, unique: true
  property :password, BCryptHash

  has n, :dialogs, child_key: ['first_participant_id']
  has n, :messages, trought: :dialogs, child_key: ['sender_id']

  before :save do
    self.name.capitalize!
    self.email.downcase!
  end
end
