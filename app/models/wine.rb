class Wine < ApplicationRecord
  # Constants
  enum :color, red: 0, pink: 1, white: 2

  # Scopes

  # Callbacks

  # Attr_accessor

  # Associations

  # Validations
  validates :name, :year, presence: true

  # Delegation

  # Methods
end
