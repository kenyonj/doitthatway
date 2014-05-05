class Video < ActiveRecord::Base
  belongs_to :user

  has_many :comments

  has_many :votes
  has_many :upvotes, class_name: 'Upvote'
  has_many :downvotes, class_name: 'Downvote'

  def self.published
    where(published: true)
  end

  def self.unpublished
    where(published: false)
  end

  def self.unpublished_submissions?
    exists?(published: false)
  end

  def youtube_id
    youtube_url.split('=')[1]
  end

  def publish
    update(published: true)
  end

  def unpublish
    update(published: false)
  end

  def up_votes
    upvotes_count
  end

  def down_votes
    downvotes_count
  end

  def score
    up_votes - down_votes
  end
end
