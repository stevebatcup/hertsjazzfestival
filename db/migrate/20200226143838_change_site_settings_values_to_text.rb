class ChangeSiteSettingsValuesToText < ActiveRecord::Migration[5.0]
	def up
    change_column :site_settings, :value, :text
  end

  def down
    change_column :site_settings, :value, :string
  end
end
