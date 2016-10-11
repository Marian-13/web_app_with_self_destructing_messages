require 'bcrypt'

class Password
  def initialize(string)
    @password = BCrypt::Password.create(string)
  end
end

# TODO unknown
