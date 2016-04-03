class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!

  protected

  def authenticate_user!
    redirect_to root_path unless session[:user_id]
  end
end
