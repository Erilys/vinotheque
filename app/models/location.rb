class Location < ApplicationRecord
  # Constants

  # Scopes

  # Callbacks

  # Attr_accessor

  # Associations
  has_many :stocks

  # Validations
  normalizes :name, with: ->(string) { string.strip.presence }

  validates :name, :slots, presence: true
  validates :slots, numericality: { greater_than_or_equal_to: 0 }

  # Delegation

  # Methods
  def slots_taken
    stocks.sum(&:quantity).to_i
  end

  def overflow?
    slots_taken > slots
  end
end
