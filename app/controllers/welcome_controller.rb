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

          array = Expense.select('net', 'period_posted', 'unit_id').where(unit_id: unit.unit_id)

          @expenses[unit.unit_id] = ["01" => [], "02" => [], "03" => [], "04" => [], "05" => [], "06" => [], "07" => [], "08" => [], "09" => [], "10" => [], "11" => [], "12" => [], "different" => []]

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
              # end of the month_posted if

            end
            # end of the unit_expense if

          end
          # end of the array do

        end
        # end of the unit.lease_end 6 months if

      end
      # end of the unit.lease_end / lease_start nil if

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
