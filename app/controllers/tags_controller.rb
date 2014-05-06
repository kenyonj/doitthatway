class TagsController < ApplicationController
  before_action :authorize_user, except: [:show]

  def update
    video = find_video
    video.update(tag_list_params)
    @tags = video.tags
  end

  def show
    tag = find_tag
    @videos = tag.videos
  end

  private

  def tag_list_params
    params.require(:video).permit(:tag_list)
  end

  def find_video
    if current_user.admin?
      Video.find(params[:video_id])
    else
      current_user.videos.find(params[:video_id])
    end
  end

  def find_tag
    Tag.find_by(body: params[:id])
  end
end
