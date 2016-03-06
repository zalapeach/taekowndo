require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }
  let(:access_token) do
    OmniAuth::AuthHash.new(
      provider: 'google_oauth2', info: { email: user.email }
    )
  end

  it { expect(user).to respond_to(:email) }

  describe '.omniauth_auth' do
    context 'with existing email' do
      it 'returns user' do
        expect(User.omniauth_auth(access_token)).to eq(user)
      end
    end

    context 'without existing email' do
      it 'returns nil' do
        access_token.info[:email] = 'jlcjulio@gmail.com'
        expect(User.omniauth_auth(access_token)).to eq(nil)
      end
    end
  end
end
