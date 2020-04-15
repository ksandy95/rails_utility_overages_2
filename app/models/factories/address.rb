FactoryGirl.define do
  factory :address do
    city           { Faker::Address.city }
    street_address { Faker::Address.street_address }
    unit           { Faker::Address.secondary_address }
    zip            { Faker::Address.zip }
    state          { Faker::Address.state }
  end
end
