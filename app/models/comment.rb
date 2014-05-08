class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :video

  def self.recent
    order(created_at: :desc)
  end

  def self.paginated(page)
    page(page)
  end
end
