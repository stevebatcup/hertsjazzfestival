class CreateMusicians < ActiveRecord::Migration[5.0]
  def change
    create_table :musicians do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end

    create_table :instruments_musicians do |t|
      t.integer :instrument_id
      t.integer :musician_id
    end

  end
end
