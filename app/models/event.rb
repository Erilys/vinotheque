class Event < ApplicationRecord
  # Constants

  # Scopes

  # Callbacks

  # Attr_accessor

  # Associations
  has_many_attached :pictures

  has_many :transactions, as: :source
  accepts_nested_attributes_for :transactions, allow_destroy: true

  # Validations
  normalizes :comment, :comment_wine, with: ->(string) { string.strip.presence }

  validates :start_date, presence: true

  # Delegation

  # Methods
end
