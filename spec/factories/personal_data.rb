FactoryBot.define do
  factory :personal_datum do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    nick_name { Faker::Name.first_name }
    phone_number { "333-333-4444" }
    email { Faker::Internet.email }
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip_code }
  end
end
