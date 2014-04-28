module ApplicationHelper
  def pending_submissions_class
    if Video.pending_submissions?
      'pulse'
    end
  end
end
