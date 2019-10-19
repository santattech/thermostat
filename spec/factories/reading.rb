FactoryBot.define do
  factory :reading do
    tracking_number { Time.now.to_i }
    temperature { Faker::Number.decimal }
    humidity { Faker::Number.decimal }
    battery_charge { Faker::Number.decimal }
  end
end
