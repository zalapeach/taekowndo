class SessionsController < ApplicationController
  def create
    user = User.omniauth_auth(env['omniauth.auth'])
    if user.nil?
      redirect_to root_path
    else
      session[:user_id] = user.id
      redirect_to admin_root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
