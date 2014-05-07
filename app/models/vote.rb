class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :video

  validates :user_id, presence: true, uniqueness: { scope: :video_id }

  def self.upvotes
    where(type: 'Upvote')
  end

  def self.downvotes
    where(type: 'Downvote')
  end
end
