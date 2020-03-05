class AddUserApprovedToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :user_approved, :boolean, default: false
  end
end
