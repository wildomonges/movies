class MoviePersonRole < ApplicationRecord
  extend Enumerize

  enumerize :role, in: Role.roles, predicates: true

  belongs_to :movie
  belongs_to :person

  validates :movie, :person, :role, presence: true
end
