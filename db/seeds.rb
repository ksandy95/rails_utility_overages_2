# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

expenses_file = Rails.root + 'db/expenses.csv'
leases_file = Rails.root + 'db/leases.csv'
reservations_file = Rails.root + 'db/reservations.csv'

  csv_text = File.read(expenses_file)
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    t = Expense.new
    t.period_posted = row['Period Posted']
    t.account_name = row['Account Name']
    t.net = row['Net']
    t.invoice_number = row['Invoice Number']
    t.unit_id = row['Unit Number']
    t.vendor_id = row['Vendor ID']
    t.save
  end
  puts "There are now #{Expense.count} rows in the expenses table"

# --------------------------------------------------------------------

  csv_text = File.read(leases_file)
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    t = Lease.new
    t.unit_id = row['Unit Number']
    t.lease_start = row['Lease Start']
    t.lease_end = row['Lease End']
    t.bedrooms = row['Bedrooms']
    t.unit_classification = row['Unit Classification']
    t.third_party_unit = row['Third Party Unit']
    t.save
  end
  puts "There are now #{Lease.count} rows in the leases table"
  
# --------------------------------------------------------------------

  csv_text = File.read(reservations_file)
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    t = Reservation.new
    t.reservation_number = row['Reservation Number']
    t.parent_name = row['Parent Name']
    t.arrival = row['Arrival']
    t.departure = row['Departure']
    t.unit_id = row['Unit Number']
    t.master_sub_unit = row['Master/Sub Unit']
    t.nch_3p = row['3P/NCH']
    t.bedrooms = row['Bedrooms']
    t.save
  end
  puts "There are now #{Reservation.count} rows in the reservations table"
