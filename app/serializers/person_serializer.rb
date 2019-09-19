# frozen_string_literal: true

class PersonSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :last_name, :first_name, :gender
  has_many :aliases

  Role.roles.each do |role|
    attribute "movies_as_#{role}" do |person|
      person.movies.select(:id, :title, :release_year).where(movie_person_roles: { role: role })
    end
  end
end
