class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :is_logged_in?
  
  protect_from_forgery
  include SessionsHelper
  include MessagesHelper

  def redirect_back_or_root
    if request.env["HTTP_REFERER"].present?
      redirect_to :back
    else
      redirect_to root_url
    end
  end

  def is_logged_in?
    if !logged_in? && request.path != login_path
      redirect_to login_path
    end
  end
end
