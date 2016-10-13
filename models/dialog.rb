class Dialog
  include DataMapper::Resource

  property :id,                  Serial
  property :second_participant_id, Integer, required: true

  belongs_to :user, child_key: ['first_participant_id']  # defaults to :required => true
  has n, :messages
end
