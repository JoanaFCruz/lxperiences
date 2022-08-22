class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :user_id
      t.integer :experience_id

      t.timestamps
    end
  end
end
