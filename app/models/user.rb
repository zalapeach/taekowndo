class User < ActiveRecord::Base
  def self.omniauth_auth(omniauth_info)
    data = omniauth_info.info
    user = User.where(email: data[:email]).first
    user
  end
end
