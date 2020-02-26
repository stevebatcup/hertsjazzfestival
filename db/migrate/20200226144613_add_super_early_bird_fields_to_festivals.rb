class AddSuperEarlyBirdFieldsToFestivals < ActiveRecord::Migration[5.0]
  def change
  	add_column	:festivals, :super_earlybird_standard_price, :decimal, :precision => 8, :scale => 2, after: :earlybird_students_price
  	add_column	:festivals, :super_earlybird_members_price, :decimal, :precision => 8, :scale => 2, after: :super_earlybird_standard_price
  	add_column	:festivals, :super_earlybird_students_price, :decimal, :precision => 8, :scale => 2, after: :super_earlybird_members_price

  	rename_column :festivals, :early_bird_cutoff_date, :earlybird_cutoff_date
  	add_column :festivals, :super_earlybird_cutoff_date, :date, after: :earlybird_cutoff_date

  	add_column	:days, :super_earlybird_standard_price, :decimal, :precision => 8, :scale => 2, after: :earlybird_students_price
  	add_column	:days, :super_earlybird_members_price, :decimal, :precision => 8, :scale => 2, after: :super_earlybird_standard_price
  	add_column	:days, :super_earlybird_students_price, :decimal, :precision => 8, :scale => 2, after: :super_earlybird_members_price
  end
end
