class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.integer :passanger_count
      t.timestamps
    end
    add_reference :bookings, :flight, foreign_key: true
    add_reference :bookings, :owner, foreign_key: { to_table: :users }
  end
end
