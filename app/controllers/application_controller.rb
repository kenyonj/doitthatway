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

  def authorize_user
    if current_user.is_a?(Guest)
      redirect_to :back
    end
  end

  def current_user
    @current_user ||= find_current_user
  end
  helper_method :current_user

  def find_current_user
    find_session_user || Guest.new
  end

  def find_session_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end

  def set_last_viewed_video_id(id)
    session[:last_viewed_video_id] = id
  end

  def last_viewed_video_id
    session[:last_viewed_video_id]
  end
end
