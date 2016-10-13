class Dialog
  include DataMapper::Resource

  property :id, Serial

  belongs_to :first_participant,   model: 'User'
  belongs_to :second_particicpant, model: 'User'
end

Dialog.finalize
