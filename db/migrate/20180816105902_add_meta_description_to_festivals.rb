class AddMetaDescriptionToFestivals < ActiveRecord::Migration[5.0]
  def change
    add_column :festivals, :meta_description, :text
  end
end
