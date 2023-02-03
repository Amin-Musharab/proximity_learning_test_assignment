FactoryBot.define do
  factory :employment do
    employer { Faker::Company.name }
    date_started { Faker::Date.between(from: 5.years.ago, to: 3.years.ago) }
    date_ended { Faker::Date.between(from: 2.years.ago, to: Date.yesterday) }
    association :personal_datum, factory: :personal_datum
  end
end
