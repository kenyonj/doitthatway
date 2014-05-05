class Guest
  def admin?
    false
  end

  def moderator?
    false
  end

  def owns?(comment)
    false
  end

  def can_edit?
    false
  end

  def logged_in?
    false
  end

  def upvoted_this?(video)
    false
  end

  def downvoted_this?(video)
    false
  end
end
