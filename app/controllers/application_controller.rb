class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authorize_moderator
    if !current_user.moderator?
      render nothing: true, status: :unauthorized
    end
  end

  def authorize_admin
    if !current_user.admin?
      render nothing: true, status: :unauthorized
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def signed_in_user
    current_user || Guest.new
  end
  helper_method :signed_in_user
end
