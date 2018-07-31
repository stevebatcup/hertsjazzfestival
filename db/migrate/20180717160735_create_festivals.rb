class CreateFestivals < ActiveRecord::Migration[5.0]
  def change
    create_table :festivals do |t|
      t.string :year
      t.integer :venue_id
      t.string :gallery_url
      t.boolean :is_current, default: false
			t.decimal :weekend_standard_price, :precision => 8, :scale => 2
			t.decimal :weekend_members_price, :precision => 8, :scale => 2
			t.decimal :weekend_students_price, :precision => 8, :scale => 2
			t.decimal :earlybird_standard_price, :precision => 8, :scale => 2
			t.decimal :earlybird_members_price, :precision => 8, :scale => 2
			t.decimal :earlybird_students_price, :precision => 8, :scale => 2
			t.string :booking_url

      t.timestamps
    end
  end
end
