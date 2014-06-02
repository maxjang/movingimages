class CreateSavedExperiences < ActiveRecord::Migration
  def change
    create_table :saved_experiences do |t|
      t.string      :instagram_media_author
      t.string      :instagram_media_id
      t.string      :instagram_media_url
      t.text        :instagram_media_text
      t.references  :user

      t.timestamps
    end
  end
end
