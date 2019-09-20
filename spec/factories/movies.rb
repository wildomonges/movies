require 'faker'

FactoryBot.define do
  factory :movie, class: Movie do
    title { Faker::Name.name_with_middle }
    release_year { Faker::Number.within(range: 1800..2020) }
  end
end
