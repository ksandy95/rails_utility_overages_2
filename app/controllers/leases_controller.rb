class LeasesController < ApplicationController

  def index

  end

  def show
    @lease = Lease.where(unit_id: params[:id])
    # @address = {city: Faker::Address.city, street_name: Faker::Address.street_name, street_address: Faker::Address.street_address, unit: Faker::Address.secondary_address, zip: Faker::Address.zip, state: Faker::Address.state}
    # @fake_address = FactoryGirl.build(:destination)
    expenses = Expense.first(6)
    @last_month_expenses = [expenses[0], expenses[1], expenses[2]]
    x = []
    @last_month_expenses.each do |expense|
      x << expense.net
    end
    @last_month_expense_sum = x.sum
    @last_month_reservations = []
# ------------------------------------------------------------------------
    @current_month_expenses = [expenses[3], expenses[4], expenses[5]]
    y = []
    @current_month_expenses.each do |expense|
      y << expense.net
    end
    @current_month_expense_sum = y.sum
    @current_month_reservations = []
  end

end
