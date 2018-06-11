class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :ensure_login

  protected
    def ensure_login
      redirect_to login_path unless session[:reviewer_id]
    end
end
