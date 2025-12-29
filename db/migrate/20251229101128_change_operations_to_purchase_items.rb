class ChangeOperationsToPurchaseItems < ActiveRecord::Migration[8.1]
  def change
    rename_table :operations, :purchase_items
  end
end
