require 'rails_helper'
RSpec.describe "Looking At Welcome Page" do
  before :each do
    Rails.application.load_seed
  end

  it 'takes me to the page' do
    visit '/'
  end


end
