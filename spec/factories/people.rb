require 'faker'

FactoryBot.define do
  factory :male_person, class: Person do
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.male_first_name }
    gender { :male }
  end

  factory :female_person, class: Person do
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.female_first_name }
    gender { :female }
  end
end
