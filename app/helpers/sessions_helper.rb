module SessionsHelper

  # log in a user
  def log_in(user)
    # session method provided by rails
    session[:user_id] = user.id
  end

  def current_user?(user)
    user == current_user
  end

  def current_user
    # if current_user is nil, assign from db, else leave as is
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # returns true if logged in or false otherwise
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
