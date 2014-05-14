module ApplicationHelper
  def unpublished_submissions_class
    if unpublished_submissions?
      'pulse'
    end
  end

  def unpublished_submissions?
    Video.unpublished_submissions?
  end

  def top_tags(num=3)
    Tag.top_tags(num)
  end

  def new_video
    @video = Video.new
  end

  def youtube_embed(video)
    embed_code = "<iframe width='560' height='315'"\
                 "src='http://www.youtube.com/embed/#{video.youtube_id}"\
                 "?rel=0;3&amp;autohide=1&amp;showinfo=0'"\
                 "frameborder='0' allowfullscreen>"\
                 "</iframe>"
    embed_code.html_safe
  end

  def youtube_thumbnail(video)
    thumbnail_code = "http://img.youtube.com/vi/#{video.youtube_id}/0.jpg"
    thumbnail_code.html_safe
  end

  def class_for_upvote(video)
    if current_user.upvoted_this?(video)
      'voting-button upvote voted'
    else
      'voting-button upvote'
    end
  end

  def class_for_downvote(video)
    if current_user.downvoted_this?(video)
      'voting-button downvote voted'
    else
      'voting-button downvote'
    end
  end
end
