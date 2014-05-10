class VoteProcessor
  def initialize(user, type, target)
    @user = user
    @type = type
    @target = target
  end

  def process
    if identical_vote_exists?
      remove_votes
    else
      remove_votes
      create_vote
    end
  end

  private

  attr_reader :user, :type, :target

  def upvote?
    type == 'Upvote'
  end

  def downvote?
    type == 'Downvote'
  end

  def target_vote_types
    if upvote?
      target.upvotes
    elsif downvote?
      target.downvotes
    end
  end

  def create_vote
    target_vote_types.create(user: user)
  end

  def identical_vote_exists?
    target_vote_types.find_by(user: user)
  end

  def remove_votes
    target.votes.where(user: user).destroy_all
  end

  def vote_type
    type.constantize
  end
end
