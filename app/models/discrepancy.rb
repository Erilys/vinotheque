class Discrepancy < ApplicationRecord
  include StockMovementConcern
  # Constants

  # Scopes

  # Callbacks

  # Attr_accessor

  # Associations

  # Validations
  validates :quantity, numericality: { only_integer: true }

  # Delegation

  # Methods
end
