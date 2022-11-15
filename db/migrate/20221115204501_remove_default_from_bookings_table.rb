class RemoveDefaultFromBookingsTable < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :status, :integer, default: nil
  end
end
