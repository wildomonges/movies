class PersonSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel

  attributes :id, :last_name, :first_name, :gender
  has_many :aliases

  Role.roles.each do |role|
    attribute "movies_as_#{role}" do |person|
      person.movies.where(movie_person_roles: { role: role })
    end
  end
end
