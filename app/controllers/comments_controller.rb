class CommentsController < ApplicationController
  def create
    video = find_video
    @comment = video.comments.create(comment_params)
  end

  def destroy
    @comment = find_comment
    @comment.destroy
  end

  private

  def find_video
    Video.find(params[:video_id])
  end

  def find_comment
    current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).
      permit(:body).
      merge(user: current_user)
  end
end
