class MoviePersonRole < ApplicationRecord
  extend Enumerize

  enumerize :role, in: Role.roles, predicates: true

  belongs_to :movie
  belongs_to :person

  accepts_nested_attributes_for :movie, :person

  validates :movie, :person, :role, presence: true
end
