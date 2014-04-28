class UnpublishedSubmissionsController < ApplicationController
  before_action :authorize_moderator

  def index
    @unpublished_videos = unpublished_videos
  end

  def update
    @video = find_video
    @video.publish
  end

  private

  def find_video
    Video.find(params[:id])
  end

  def unpublished_videos
    Video.unpublished
  end
end
