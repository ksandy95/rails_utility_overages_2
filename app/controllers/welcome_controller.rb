class WelcomeController < ApplicationController

  # this show page will have links to the other index pages
  # but will function as the primart page for viewing informaiton in a table
  # based format. with clickable links to show pages for more information

  def show
    @units = Lease.select('unit_id', 'lease_end', 'lease_start').limit(2000)
    @new_units = []
    @expenses = {}
    @array_of_last_6_months = [6.months.ago.month.to_s, 5.months.ago.month.to_s, 4.months.ago.month.to_s, 3.months.ago.month.to_s, 2.months.ago.month.to_s, 1.months.ago.month.to_s]

    @units.each do |unit|
      if unit.lease_end != nil && unit.lease_start != nil
        if unit.lease_end > 6.months.ago
          @new_units << unit

          unit_expenses = Expense.select('net', 'period_posted', 'unit_id').where(unit_id: unit.unit_id)
          # i only want the expenses from year 2019 and 2020. the above gives me all unit expenses from all years.
          # what i really want are only expenses from the past 6 months

          @expenses[unit.unit_id] = ["01" => [], "02" => [], "03" => [], "04" => [], "05" => [], "06" => [], "07" => [], "08" => [], "09" => [], "10" => [], "11" => [], "12" => [], "different" => []]
          # can i change the values from 01..12 to only the array_of_last_6_months[0], array_of_last_6_months[1], etc...?

          # unit_expenses.map do |unit_expense|
            # if unit_expense != nil
              # month_posted = unit_expense.period_posted.split('.')[1]
              # six = 6.months.ago.month
              # five = 5.months.ago.month
              # four = 4.months.ago.month
              # three = 3.months.ago.month
              # two = 2.months.ago.month
              # one = 1.months.ago.month

              # if month_posted == six.to_s
              #   @expenses[unit.unit_id][0][six] << unit_expense
              #   unit.expenses_six_months_ago = @expenses[unit.unit_id][0][six]
              #
              # elsif month_posted == five.to_s
              #   @expenses[unit.unit_id][0][five] << unit_expense
              #   unit.expenses_five_months_ago = @expenses[unit.unit_id][0][five]
              #
              # elsif month_posted == four.to_s
              #   @expenses[unit.unit_id][0][four] << unit_expense
              #   unit.expenses_four_months_ago = @expenses[unit.unit_id][0][four]
              #
              # elsif month_posted == three.to_s
              #   @expenses[unit.unit_id][0][three] << unit_expense
              #   unit.expenses_three_months_ago = @expenses[unit.unit_id][0][three]
              #
              # elsif month_posted == two.to_s
              #   @expenses[unit.unit_id][0][two] << unit_expense
              #   unit.expenses_two_months_ago = @expenses[unit.unit_id][0][two]
              #
              # elsif month_posted == one.to_s
              #   @expenses[unit.unit_id][0][one] << unit_expense
              #   unit.expenses_one_months_ago = @expenses[unit.unit_id][0][one]
              #
              # else
              #   @expenses[unit.unit_id][0]["different"] << unit_expense
              # end
              # end of the month_posted if

            # end
            # end of the unit_expense if

          # end
          # end of the unit_expenses do

        end
        # end of the unit.lease_end 6 months if

      end
      # end of the unit.lease_end / lease_start nil if
      # binding.pry
      # unit.expenses_six_months_ago = @expenses[unit.unit_id]["#{6.months.ago.month.to_s}"]


    end
    # end of the @units.each do

    @six_months_ago = I18n.t("date.month_names")[6.months.ago.month]
    @five_months_ago = I18n.t("date.month_names")[5.months.ago.month]
    @four_months_ago = I18n.t("date.month_names")[4.months.ago.month]
    @three_months_ago = I18n.t("date.month_names")[3.months.ago.month]
    @two_months_ago = I18n.t("date.month_names")[2.months.ago.month]
    @one_month_ago = I18n.t("date.month_names")[1.months.ago.month]
  end
  # above is the end of the show method

end
