module ApplicationHelper
  def unpublished_submissions_class
    if unpublished_submissions?
      'pulse'
    end
  end

  def unpublished_submissions?
    Video.unpublished_submissions?
  end

  def new_video
    Video.new
  end

  def youtube_embed(video)
    embed_code = "<iframe width='560' height='315'"\
                 "src='http://www.youtube.com/embed/#{video.youtube_id}"\
                 "?rel=0;3&amp;autohide=1&amp;showinfo=0'"\
                 "frameborder='0' allowfullscreen>"\
                 "</iframe>"
    embed_code.html_safe
  end
end
