class AddIsFilmToGigs < ActiveRecord::Migration[5.0]
  def change
    add_column :gigs, :is_film, :boolean, default: false
  end
end
