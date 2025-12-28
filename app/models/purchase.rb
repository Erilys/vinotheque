class Purchase < ApplicationRecord
  # Constants

  # Scopes

  # Callbacks

  # Attr_accessor
  attribute :purchase_date, default: Date.today

  # Associations
  belongs_to :wine

  has_many :operations, as: :source
  accepts_nested_attributes_for :operations, allow_destroy: true

  # Validations
  normalizes :store, :town, with: ->(string) { string.strip.presence }

  validates :operations, presence: true

  # Delegation

  # Methods
end
