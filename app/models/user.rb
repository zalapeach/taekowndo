class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.omniauth_auth(omniauth_info)
    data = omniauth_info.info
    user = User.where(email: data[:email]).first
    user
  end
end
