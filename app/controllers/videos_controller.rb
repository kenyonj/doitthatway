class VideosController < ApplicationController
  respond_to :html

  def show
    @video = find_video
    @comments = @video.comments.recent.paginated(params[:page])
    set_last_viewed_video_id(@video.id)
  end

  def create
    video = current_user.videos.create(video_params)
    respond_with video, location: root_path
  end

  private

  def find_video
    Video.find(params[:id])
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
