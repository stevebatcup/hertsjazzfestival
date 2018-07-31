class AlterStartsAndEndsFieldsForGigs < ActiveRecord::Migration[5.0]
  def change
  	remove_column	:gigs, :starts, :datetime
  	remove_column	:gigs, :ends, :datetime
  	add_column	:gigs, :starts, :time
  	add_column	:gigs, :ends, :time
  end
end
