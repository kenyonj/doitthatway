class VideosController < ApplicationController
  def index
    video = random_video
    redirect_to video
  end

  def show
    @video = find_video
  end

  private

  def find_video
    Video.find(params[:id])
  end

  def random_video
    Video.published.sample || NullVideo.new
  end
end
