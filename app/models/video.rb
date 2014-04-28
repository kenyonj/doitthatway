class Video < ActiveRecord::Base
  belongs_to :user

  def self.published
    where(published: true)
  end

  def self.unpublished
    where(published: false)
  end

  def self.unpublished_submissions?
    exists?(published: false)
  end

  def publish
    update(published: true)
  end

  def unpublish
    update(published: false)
  end

  def up_votes
    20
  end

  def down_votes
    3
  end

  def score
    up_votes - down_votes
  end
end
