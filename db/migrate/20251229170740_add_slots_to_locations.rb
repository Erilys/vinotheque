class AddSlotsToLocations < ActiveRecord::Migration[8.1]
  def change
    add_column :locations, :slots, :integer, null: false
  end
end
