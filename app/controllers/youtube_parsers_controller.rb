class YoutubeParsersController < ApplicationController
  def show
    @youtube_video = get_youtube_json
  end

  private

  def get_youtube_json
    YoutubeJsonParser.new(video_form_params)
  end

  def video_form_params
    params[:youtube][:video_url]
  end
end
