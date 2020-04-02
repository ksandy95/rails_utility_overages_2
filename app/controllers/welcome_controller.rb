class WelcomeController < ApplicationController

  # this show page will have links to the other index pages
  # but will function as the primart page for viewing informaiton in a table
  # based format. with clickable links to show pages for more information
  def show
    @units = Lease.select('unit_id').distinct
    #get the units that only have leases within these 6 months. Example
    # a lease that had activity within the past 6 months will show up
    # a lease that ended 7 months ago will not show up
    # a lease that ended 6 months ago will show up
    # a lease that ended 5 months ago will show up

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
