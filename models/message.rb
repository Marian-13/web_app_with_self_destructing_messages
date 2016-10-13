class Message
  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :link, String
  property :destruction_type, Boolean
  property :destruction_condition, Integer
  property :created_at, DateTime

  belongs_to :dialog
  belongs_to :sender, model: 'User'
end

Message.finalize
