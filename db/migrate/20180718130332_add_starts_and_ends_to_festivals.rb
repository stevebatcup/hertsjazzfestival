class AddStartsAndEndsToFestivals < ActiveRecord::Migration[5.0]
  def change
    add_column :festivals, :starts, :datetime
    add_column :festivals, :ends, :datetime
  end
end
