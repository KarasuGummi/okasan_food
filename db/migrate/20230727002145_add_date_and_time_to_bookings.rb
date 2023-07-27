class AddDateAndTimeToBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :date_time
    add_column :bookings, :date, :date
    add_column :bookings, :time, :time
  end
end
