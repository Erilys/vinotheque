class Stock < ApplicationRecord
  # Constants

  # Scopes

  # Associations
  belongs_to :wine
  belongs_to :location

  # Delegation

  # Methods
  def readonly? = true

  def self.refresh
    Scenic.database.refresh_materialized_view(table_name, concurrently: false, cascade: false)
  end
end
