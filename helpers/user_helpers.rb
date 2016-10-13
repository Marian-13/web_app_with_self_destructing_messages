module UserHelpers
  # Controller helpers
  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect to('/login') unless current_user
  end


  # View helpers
  def name_value
    params[:name] || ''
  end

  def email_value
    params[:email] || ''
  end
end
