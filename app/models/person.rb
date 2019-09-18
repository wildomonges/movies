# frozen_string_literal: true

class Person < ApplicationRecord
  extend Enumerize

  enumerize :gender, in: %i[male female], default: :male, predicates: true

  has_many :movie_person_roles, dependent: :destroy
  has_many :movies, through: :movie_person_roles, dependent: :destroy
  has_many :aliases, dependent: :destroy

  validates :last_name, :first_name, :gender, presence: true
  validates :last_name, :first_name, length: 3..50

  # Dinamic definition of instance methods based on roles
  Role.roles.each do |role|
    define_method "movies_as_#{role}" do
      movies.where(movie_person_roles: { role: role })
    end
  end
end
