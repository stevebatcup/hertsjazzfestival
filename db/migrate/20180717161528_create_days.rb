class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.date :date
      t.integer :festival_id
      t.decimal :day_standard_price, :precision => 8, :scale => 2
      t.decimal :day_members_price, :precision => 8, :scale => 2
      t.decimal :day_students_price, :precision => 8, :scale => 2
      t.decimal :earlybird_standard_price, :precision => 8, :scale => 2
      t.decimal :earlybird_members_price, :precision => 8, :scale => 2
      t.decimal :earlybird_students_price, :precision => 8, :scale => 2
      t.integer :sort
    end
  end
end
