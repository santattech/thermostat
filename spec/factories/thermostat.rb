FactoryBot.define do
  factory :thermostat do
    location { Faker::Address.full_address }
    household_token { Time.now.to_i }
  end
end
