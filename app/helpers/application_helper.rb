module ApplicationHelper
  def unpublished_submissions_class
    if unpublished_submissions?
      'pulse'
    end
  end

  def unpublished_submissions?
    Video.unpublished_submissions?
  end
end
