class LeasesController < ApplicationController

  def index

  end

  def show
    # binding.pry
    @lease = Lease.where(unit_id: params[:id])
    # binding.pry
  end

end
