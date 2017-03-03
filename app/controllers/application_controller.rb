class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include MessagesHelper

  def redirect_back_or_root
    if request.env["HTTP_REFERER"].present?
      redirect_to :back
    else
      redirect_to root_url
    end
  end

end
