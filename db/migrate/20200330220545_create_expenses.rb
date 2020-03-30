class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :period_posted
      t.string :account_name
      t.float :net
      t.integer :invoice_number
      t.integer :unit_id
      t.integer :vendor_id
    end
  end
end
