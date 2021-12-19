class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::Helpers
  include ActionController::Sessions
  skip_before_action :verify_authenticity_token, raise: false

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      redirect_to 'https://todolist-cvwo.herokuapp.com'
    end
  end
end
