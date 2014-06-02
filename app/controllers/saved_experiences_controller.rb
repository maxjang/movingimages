class SavedExperiencesController < ApplicationController
  
  def index
    if session[:user_id] != nil
      @experiences = SavedExperience.where(user_id: session[:user_id])
    end
  end
  
  def create
    user_id = session[:user_id]
    if SavedExperience.find_by_user_id_and_instagram_media_id(user_id, params[:instagram_media_id])
      saved_experience = SavedExperience.find_by_user_id_and_instagram_media_id(user_id, params[:instagram_media_id]).id
      SavedExperiencesController.destroy(saved_experience)
      redirect_to root_url, :notice => "Unsaved"
    else
      new_save_exp = SavedExperience.new
      new_save_exp.instagram_media_author = params[:instagram_media_author]
      new_save_exp.instagram_media_id = params[:instagram_media_id]
      new_save_exp.instagram_media_url = params[:instagram_media_url]
      new_save_exp.instagram_media_text = params[:instagram_media_text]
      new_save_exp.user_id = user_id
      new_save_exp.save
      redirect_to root_url, :notice => "Just Saved"
    end
  end
  
  def self.destroy(exp)
    SavedExperience.find(exp).destroy
  end
  
end
