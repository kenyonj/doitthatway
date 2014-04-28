class User < ActiveRecord::Base
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

  def can_edit?
    admin? || moderator?
  end

  def update_access(access_change)
    type = access_change[:type].to_sym
    value = convert_to_boolean(access_change[:value])
    update(type => value)
  end

  private

  def convert_to_boolean(string)
    if string == 'true'
      true
    elsif string == 'false'
      false
    end
  end
end
