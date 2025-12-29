class Drink < ApplicationRecord
  include OperationConcern
  # Constants

  # Scopes

  # Callbacks

  # Attr_accessor

  # Associations
  belongs_to :event, optional: true

  has_many_attached :pictures

  # Validations
  # validates :purchase_item, presence: true

  # Delegation

  # Methods
end
