class VideoSearchesController < ApplicationController
  def show
    @query = query
    @search = process_video_search
  end

  private

  def process_video_search
    VideoSearcher.new(query)
  end

  def query
    params[:search][:query]
  end
end
