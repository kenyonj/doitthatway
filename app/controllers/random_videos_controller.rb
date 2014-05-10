class RandomVideosController < ApplicationController
  def show
    redirect_to random_video
  end

  private

  def random_video
    Video.random_video(last_viewed_video_id)
  end
end
