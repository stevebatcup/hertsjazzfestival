class AddEarlyBirdCutoffDateToFestivals < ActiveRecord::Migration[5.0]
  def change
    add_column :festivals, :early_bird_cutoff_date, :date
  end
end
