class Alias < ApplicationRecord
  belongs_to :person

  validates :person, presence: true
  validates :name, length: 1..50, presence: true
end
