class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def set_current_user
    @current_user = User.find(session[:user_id])
  end
end
