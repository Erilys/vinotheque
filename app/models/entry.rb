class Entry < ApplicationRecord
  # Constants

  # Scopes

  # Callbacks

  # Attr_accessor
  belongs_to :wine

  # Associations

  # Validations
  normalizes :store, :town, with: ->(string) { string.strip.presence }

  # validates :name, presence: true

  # Delegation

  # Methods
end
