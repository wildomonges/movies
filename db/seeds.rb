require 'faker'

ActiveRecord::Base.transaction do
  male = Person.find_or_create_by!(last_name: Faker::Name.last_name, first_name: Faker::Name.male_first_name, gender: :male)
  female = Person.find_or_create_by!(last_name: Faker::Name.last_name, first_name: Faker::Name.female_first_name, gender: :female)

  Alias.find_or_create_by!(person: male, name: Faker::Name.male_first_name)
  Alias.find_or_create_by!(person: female, name: Faker::Name.female_first_name)

  movie1 = Movie.find_or_create_by!(title: Faker::Name.first_name, release_year: Faker::Number.within(range: 1800..2020))
  movie2 = Movie.find_or_create_by!(title: Faker::Name.first_name, release_year: Faker::Number.within(range: 1800..2020))
  movie3 = Movie.find_or_create_by!(title: Faker::Name.first_name, release_year: Faker::Number.within(range: 1800..2020))

  MoviePersonRole.find_or_create_by!(movie: movie1, person: male, role: :actor)
  MoviePersonRole.find_or_create_by!(movie: movie2, person: female, role: :director)
  MoviePersonRole.find_or_create_by!(movie: movie3, person: male, role: :producer)

end