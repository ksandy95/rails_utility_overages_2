class LeasesController < ApplicationController

  def index

  end

  def show
    @lease = Lease.where(unit_id: params[:id])
    # @address = {city: Faker::Address.city, street_name: Faker::Address.street_name, street_address: Faker::Address.street_address, unit: Faker::Address.secondary_address, zip: Faker::Address.zip, state: Faker::Address.state}
    # @fake_address = FactoryGirl.build(:destination)
  end

end
