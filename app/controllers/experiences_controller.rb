class ExperiencesController < ApplicationController
  require "instagram"
  
  def index
    if session[:user_id] != nil
      user = User.find(session[:user_id])
      Instagram.configure do |config|
        config.client_id = "c6dc5a77db6942f3a22c9e6a469972b2"
        config.access_token = user.token
      end
      max_id = params[:max_id] if params[:max_id]
      @experiences = Instagram.tag_recent_media("food_korea", {max_tag_id: max_id})
      @max_tag_id = Instagram.tag_recent_media("food_korea", {max_tag_id: max_id} ).pagination[:next_max_tag_id]
    end
  end

  def show
    @experience = Instagram.media_item(params[:id])
  end

end
