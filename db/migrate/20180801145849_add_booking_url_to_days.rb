class AddBookingUrlToDays < ActiveRecord::Migration[5.0]
  def change
    add_column :days, :booking_url, :string
  end
end
