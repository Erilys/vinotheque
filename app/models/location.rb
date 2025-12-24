class Location < ApplicationRecord
  # Constants

  # Scopes

  # Callbacks

  # Attr_accessor

  # Associations

  # Validations
  normalizes :name, with: ->(string) { string.strip.presence }

  validates :name, presence: true

  # Delegation

  # Methods
end
