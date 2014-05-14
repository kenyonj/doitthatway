class SubmissionsController < ApplicationController
  before_action :authorize_admin, except: [:update]
  before_action :authorize_moderator, except: [:destroy]

  def update
    video = find_video
    video.unpublish
    redirect_to random_video_path
  end

  def destroy
    @video = find_video
    @video.destroy
  end

  private

  def find_video
    Video.find(params[:id])
  end
end
