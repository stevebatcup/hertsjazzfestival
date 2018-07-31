class CreateGigs < ActiveRecord::Migration[5.0]
  def change
    create_table :gigs do |t|
    	t.string	:act
    	t.integer :day_id
    	t.datetime :starts
    	t.datetime :ends
    	t.text :description
    	t.string :image
    	t.string :website
	    t.string :booking_url
	    t.integer :sort
	    t.decimal :standard_price, :precision => 8, :scale => 2
	    t.decimal :members_price, :precision => 8, :scale => 2
	    t.decimal :students_price, :precision => 8, :scale => 2

      t.timestamps
    end

    create_table :performances do |t|
    	t.integer	:gig_id
    	t.integer	:musician_id
    	t.integer	:instrument_id
    end
  end
end
