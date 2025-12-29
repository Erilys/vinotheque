class Location < ApplicationRecord
  # Constants

  # Scopes

  # Callbacks

  # Attr_accessor

  # Associations

  # Validations
  normalizes :name, with: ->(string) { string.strip.presence }

  validates :name, :slots, presence: true
  validates :slots, numericality: { greater_than_or_equal_to: 0 }

  # Delegation

  # Methods
end
