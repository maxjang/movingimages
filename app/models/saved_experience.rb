class SavedExperience < ActiveRecord::Base
  
  belongs_to :user
  
  #def self.create_entry(saved_experience_params)
  #  create! do |saved_experience|
  #    saved_experience.instagram_media_author = auth["provider"]
  #    saved_experience.instagram_media_id = auth["uid"]
  #    saved_experience.instagram_media_url = auth["info"]["name"]
  #    saved_experience.instagram_media_text = auth["info"]["image"]
  #    saved_experience.user_id = auth["credentials"]["token"]
  #  end
  #end
  
end
