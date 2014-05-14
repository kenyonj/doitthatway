class Video < ActiveRecord::Base
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :votes, dependent: :destroy
  has_many :upvotes, class_name: 'Upvote'
  has_many :downvotes, class_name: 'Downvote'

  validates :name, presence: true
  validates :description, presence: true
  validates :youtube_url, presence: true
  validates :user, presence: true

  def self.published
    where(published: true)
  end

  def self.unpublished
    where(published: false)
  end

  def self.unpublished_submissions?
    exists?(published: false)
  end

  def self.excluding(id)
    where.not(id: id)
  end

  def self.random_video(last_viewed_video_id)
    published.excluding(last_viewed_video_id).sample || NullVideo.new
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

  def tag_list
    tags.pluck(:body).join(', ')
  end

  def tag_list=(tag_string)
    self.tags = Tag.from_tag_list(tag_string)
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
