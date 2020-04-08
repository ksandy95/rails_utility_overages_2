class WelcomeController < ApplicationController

  # this show page will have links to the other index pages
  # but will function as the primart page for viewing informaiton in a table
  # based format. with clickable links to show pages for more information

  def show
    @units = Lease.select('unit_id', 'lease_end', 'lease_start')
    @new_units = []
    @expenses = {}

    @units.each do |unit|
      if unit.lease_end != nil && unit.lease_start != nil
        if unit.lease_end > 6.months.ago
          @new_units << unit
          # array = @expenses[unit.unit_id] = Expense.select('net', 'period_posted', 'unit_id').where(unit_id: unit.unit_id)
          array = Expense.select('net', 'period_posted', 'unit_id').where(unit_id: unit.unit_id)


          @expenses[unit.unit_id] = ["01" => [], "02" => [], "03" => [], "04" => [], "05" => [], "06" => [], "07" => [], "08" => [], "09" => [], "10" => [], "11" => [], "12" => [], "different" => []]
          binding.pry
          array.map do |unit_expense|
            if unit_expense != nil
              month_posted = unit_expense.period_posted.split('.')[1]

              if month_posted == "01"
                @expenses[unit.unit_id][0]["01"] << unit_expense
              elsif month_posted == "02"
                @expenses[unit.unit_id][0]["02"] << unit_expense
              elsif month_posted == "03"
                @expenses[unit.unit_id][0]["03"] << unit_expense
              elsif month_posted == "04"
                @expenses[unit.unit_id][0]["04"] << unit_expense
              elsif month_posted == "05"
                @expenses[unit.unit_id][0]["05"] << unit_expense
              elsif month_posted == "06"
                @expenses[unit.unit_id][0]["06"] << unit_expense
              elsif month_posted == "07"
                @expenses[unit.unit_id][0]["07"] << unit_expense
              elsif month_posted == "08"
                @expenses[unit.unit_id][0]["08"] << unit_expense
              elsif month_posted == "09"
                @expenses[unit.unit_id][0]["09"] << unit_expense
              elsif month_posted == "10"
                @expenses[unit.unit_id][0]["10"] << unit_expense
              elsif month_posted == "11"
                @expenses[unit.unit_id][0]["11"] << unit_expense
              elsif month_posted == "12"
                @expenses[unit.unit_id][0]["12"] << unit_expense
              else
                @expenses[unit.unit_id][0]["different"] << unit_expense
              end
            end
          end
        end
      end
    end
    @six_months_ago = I18n.t("date.month_names")[6.months.ago.month]

    @five_months_ago = I18n.t("date.month_names")[5.months.ago.month]

    @four_months_ago = I18n.t("date.month_names")[4.months.ago.month]

    three = 3.months.ago.month
    @three_months_ago = I18n.t("date.month_names")[three]

    two = 2.months.ago.month
    @two_months_ago = I18n.t("date.month_names")[two]

    one = 1.months.ago.month
    @one_month_ago = I18n.t("date.month_names")[one]
  end
  # above is the end of the show method

end

# binding.pry
# @expenses = {123{"01"{unit_expenses}, "02"{unit_expenses}}, 456{"01"{unit_expenses}, "02"{unit_expenses}, "03"{unit_expenses}}}
#   @expenses = {}
#   @expenses[89413] => ["Jan", "Feb"]
#   @expenses[89413]["01"] => [<Expense:0x007faac10d8770 id: nil, period_posted: "2020.01", net: 47.5, unit_id: 89413>,]
#   here
#           binding.pry

# @expenses[unit.unit_id] = ["01", "02"]
# x = Expense.select('net', 'period_posted', 'unit_id').where(unit_id: unit.unit_id)
# x.each do |unit_expense|
  # month_posted = unit_expense.period_posted.split('.')[1]
  # @expenses[unit.unit_id][02] = {}
  # if month_posted = "02"
    # @expenses[unit.unit_id][02] << unit_expense
    # feb unit_expense
  # end
# end
# @expenses[unit.unit_id]["#{period_posted}"]

# {88495 = {"2020.02" = [net: 59.77] }, {"2020.03" = []}}
# binding.pry
# array.group_by {|x| x['']}
