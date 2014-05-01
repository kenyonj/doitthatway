class VotesController < ApplicationController
  before_action :authorize_user

  def create
    video = find_video
    vote_type = find_vote_type
    process_vote(vote_type, video)
    redirect_to video
  end

  private

  def find_vote_type
    params[:data][:vote_type]
  end

  def find_video
    Video.find(params[:video_id])
  end
end
