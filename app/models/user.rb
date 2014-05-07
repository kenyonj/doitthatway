class User < ActiveRecord::Base
  has_many :videos

  has_many :comments

  has_many :votes
  delegate :upvotes, to: :votes
  delegate :downvotes, to: :votes

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def upvoted_this?(video)
    upvotes.exists?(video: video)
  end

  def downvoted_this?(video)
    downvotes.exists?(video: video)
  end

  def can_edit?
    admin? || moderator?
  end

  def logged_in?
    true
  end

  def can_tag?(video)
    owns?(video) || admin?
  end

  def owns?(object)
    object.user_id == id
  end

  def update_access(access_change)
    type = access_change[:type].to_sym
    value = access_change[:value]
    update(type => value)
  end
end
