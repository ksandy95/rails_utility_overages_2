class LeasesController < ApplicationController

  def index

  end

  def show
    @lease = Lease.where(unit_id: params[:id])

    expenses = Expense.first(6)
    @last_month_expenses = [expenses[0], expenses[1], expenses[2]]
    x = []
    @last_month_expenses.each do |expense|
      x << expense.net
    end
    @last_month_expense_sum = x.sum

    res1 = rand(11111..99999)
    res2 = rand(11111..99999)
    @last_month_reservations = [res1, res2]


# ------------------------------------------------------------------------

    @current_month_expenses = [expenses[3], expenses[4], expenses[5]]
    y = []
    @current_month_expenses.each do |expense|
      y << expense.net
    end
    @current_month_expense_sum = y.sum

    res3 = rand(11111..99999)
    @current_month_reservations = [res2, res3]
  end

end
