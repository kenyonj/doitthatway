class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :video

  validates :user_id, presence: true, uniqueness: { scope: :type }

  scope :upvotes, -> { where(type: 'Upvote') }
  scope :downvotes, -> { where(type: 'Downvote') }
end
