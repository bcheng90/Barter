class ApplicationController < ActionController::Base
  before_action :set_default_response_format

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      current_user = User.find_by(id: session[:user_id])
    end
  end

  protected

  def set_default_response_format
    request.format = :json
  end


end
