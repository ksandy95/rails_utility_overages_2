class WelcomeController < ApplicationController

  # this show page will have links to the other index pages
  # but will function as the primart page for viewing informaiton in a table
  # based format. with clickable links to show pages for more information

  def show
    @units = Lease.select('unit_id', 'lease_end', 'lease_start').limit(2000)
    @new_units = []
    # @expenses = {}
    # @array_of_last_6_months = [6.months.ago.month.to_s, 5.months.ago.month.to_s, 4.months.ago.month.to_s, 3.months.ago.month.to_s, 2.months.ago.month.to_s, 1.months.ago.month.to_s]

    @units.each do |unit|
      if unit.lease_end != nil && unit.lease_start != nil
        if unit.lease_end > 6.months.ago
          @new_units << unit
        end
      end
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
