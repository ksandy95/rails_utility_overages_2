class CreateReservations < ActiveRecord::Migration[5.2]
  def change

    create_table :reservations do |t|
      t.integer :reservation_number
      t.string :parent_name
      t.date :arrival
      t.date :departure
      t.integer :unit_id
      t.string :master_sub_unit
      t.string :nch_3p
      t.string :bedrooms
    end
  end
end
