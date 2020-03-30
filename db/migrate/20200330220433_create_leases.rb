class CreateLeases < ActiveRecord::Migration[5.2]
  def change
    create_table :leases do |t|
      t.integer :unit_id
      t.date :lease_start
      t.date :lease_end
      t.string :bedrooms
      t.string :unit_classification
      t.boolean :third_party_unit
    end
  end
end
