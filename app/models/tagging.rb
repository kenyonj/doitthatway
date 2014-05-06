class Tagging < ActiveRecord::Base
  belongs_to :tag, counter_cache: true
  belongs_to :video

  validates :tag_id, uniqueness: { scope: :video_id }
end
