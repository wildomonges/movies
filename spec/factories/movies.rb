require 'faker'

FactoryBot.define do
  factory :movie, class: Movie do
    title { Faker::Movie.quote }
    release_year { Faker::Number.within(range: 1800..2020) }
  end
end
