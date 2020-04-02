class WelcomeController < ApplicationController

  # this show page will have links to the other index pages
  # but will function as the primart page for viewing informaiton in a table
  # based format. with clickable links to show pages for more information

  def show
    @units = Lease.select('unit_id', 'lease_end', 'lease_start')
    @not_nil_units = []
    @new_units = []
    @units.each do |unit|
      if unit.lease_end != nil && unit.lease_start != nil
        @not_nil_units << unit
        if unit.lease_end > 6.months.ago
          @new_units << unit
        end
      end
    end

    six = 6.months.ago.month
    @six_months_ago = I18n.t("date.month_names")[six]

    five = 5.months.ago.month
    @five_months_ago = I18n.t("date.month_names")[five]

    four = 4.months.ago.month
    @four_months_ago = I18n.t("date.month_names")[four]

    three = 3.months.ago.month
    @three_months_ago = I18n.t("date.month_names")[three]

    two = 2.months.ago.month
    @two_months_ago = I18n.t("date.month_names")[two]

    one = 1.months.ago.month
    @one_month_ago = I18n.t("date.month_names")[one]
  end

end
