class AddColumnToLeases < ActiveRecord::Migration[5.2]
  def change
    add_column :leases, :expenses_six_months_ago, :float
    add_column :leases, :expenses_five_months_ago, :float
    add_column :leases, :expenses_four_months_ago, :float
    add_column :leases, :expenses_three_months_ago, :float
    add_column :leases, :expenses_two_months_ago, :float
    add_column :leases, :expenses_one_months_ago, :float
  end
end
