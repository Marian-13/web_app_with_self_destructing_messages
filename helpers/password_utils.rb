module PasswordUtils
  def valid_password_confirmation?(password, confirmation)
    unless password.empty?
      return true if password == confirmation
    end

    false
  end
end
