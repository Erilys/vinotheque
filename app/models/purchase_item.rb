class PurchaseItem < ApplicationRecord
  include OperationConcern
  # Constants

  # Scopes

  # Callbacks
  before_validation :set_wine_from_purchase, if: -> { source_type == 'Purchase' }

  # Attr_accessor
  attribute :quantity, default: 1

  # Associations
  belongs_to :location
  belongs_to :source, polymorphic: true

  # Validations

  # Delegation

  # Methods
  def set_wine_from_purchase
    self.wine = source.wine
  end
end
