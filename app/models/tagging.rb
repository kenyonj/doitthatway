class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :video

  validates :tag_id, uniqueness: { scope: :video_id }
end
