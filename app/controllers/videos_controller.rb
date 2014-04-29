class VideosController < ApplicationController
  respond_to :html

  def index
    video = random_video
    redirect_to video
  end

  def show
    @video = find_video
  end

  def create
    video = current_user.videos.create(video_params)
    respond_with video, location: root_path
  end

  private

  def find_video
    Video.find(params[:id])
  end

  def random_video
    Video.published.sample || NullVideo.new
  end

  def video_params
    params.require(:video).
      permit(
        :name,
        :youtube_url,
        :description
      )
  end
end
