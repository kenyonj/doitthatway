class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to last_viewed_video
  end

  def destroy
    session[:user_id] = nil
    redirect_to last_viewed_video
  end

  private

  def last_viewed_video
    Video.find(last_viewed_video_id)
  end
end
