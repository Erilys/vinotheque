class Entry < ApplicationRecord
  # Constants

  # Scopes

  # Callbacks

  # Attr_accessor
  attribute :purchase_date, default: Date.today

  # Associations
  belongs_to :wine

  has_many :transactions, as: :source
  accepts_nested_attributes_for :transactions, allow_destroy: true

  # Validations
  normalizes :store, :town, with: ->(string) { string.strip.presence }

  validates :transactions, presence: true

  # Delegation

  # Methods
end
