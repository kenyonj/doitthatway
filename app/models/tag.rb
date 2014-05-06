class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :videos, through: :taggings

  validates :body, presence: true, uniqueness: true

  def self.from_tag_list(tag_string)
    tag_string.split(',').map do |tag_name|
      find_or_create_by(body: tag_name.strip.downcase)
    end
  end
end
