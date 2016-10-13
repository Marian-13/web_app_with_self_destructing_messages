class Message
  include DataMapper::Resource

  property :id,                    Serial
  property :text,                  Text
  property :link,                  String
  property :destruction_type,      Boolean, required: true
  property :destruction_condition, Integer, required: true
  property :created_at,            DateTime

  belongs_to :dialog
  belongs_to :user, child_key: ['sender_id']

  # before :valid?, :method_name
end
