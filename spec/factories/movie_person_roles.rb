FactoryBot.define do
  factory :movie_person_role do
    movie { build(:movie) }
    person { build(:male_person) }
    role { Role.roles.sample }
  end
end
