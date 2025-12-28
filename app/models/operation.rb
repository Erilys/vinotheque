class Operation < ApplicationRecord
  # Constants

  # Scopes

  # Callbacks
  before_validation :set_wine_from_entry, if: -> { source_type == 'Entry' }

  # Attr_accessor
  attribute :quantity, default: 1

  # Associations
  belongs_to :location
  belongs_to :wine
  belongs_to :source, polymorphic: true

  belongs_to :event, optional: true

  # Validations

  # Delegation

  # Methods
  def set_wine_from_entry
    self.wine = source.wine
  end
end
