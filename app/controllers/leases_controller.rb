class LeasesController < ApplicationController

  def index

  end

  def show
    @lease = Lease.where(unit_id: params[:id])
  end

end
