# frozen_string_literal: true

class Movie < ApplicationRecord
  Role.roles.each do |role|
    # Create associations
    base = "#{role}_movie_person_roles".to_sym
    has_many base, -> { where(role: role) }, class_name: 'MoviePersonRole'
    has_many role.to_s.pluralize.to_sym, through: base, source: :person
  end
  has_many :movie_person_roles

  validates :title, length: 1..50, presence: true
  validates :release_year,
            numericality: {
              greater_than_or_equal_to: 1800,
              less_than_or_equal_to: Time.zone.now.year
            },
            presence: true

  def release_year_in_roman
    RomanNumerals.to_roman(release_year)
  end

end
