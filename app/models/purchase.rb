class Purchase < ApplicationRecord
  # Constants

  # Scopes

  # Callbacks

  # Attr_accessor
  attribute :purchase_date, default: Date.today

  # Associations
  belongs_to :wine

  has_many :purchase_items, as: :source
  accepts_nested_attributes_for :purchase_items, allow_destroy: true

  # Validations
  normalizes :store, :town, with: ->(string) { string.strip.presence }

  validates :purchase_items, presence: true

  # Delegation

  # Methods
end
