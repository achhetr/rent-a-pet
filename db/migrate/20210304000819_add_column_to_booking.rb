class AddColumnToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :offer_accepted, :boolean
  end
end
