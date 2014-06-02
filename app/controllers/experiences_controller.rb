class ExperiencesController < ApplicationController
  require "instagram"

  def index
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
      Instagram.configure do |config|
        config.client_id = "c6dc5a77db6942f3a22c9e6a469972b2"
        config.access_token = @user.token
      end
      @instagram = Instagram.user_media_feed(@user.uid)
    end
  end

end
