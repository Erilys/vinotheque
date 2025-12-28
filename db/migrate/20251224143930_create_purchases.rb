class CreatePurchases < ActiveRecord::Migration[8.1]
  def change
    create_table :purchases do |t|
      t.references :wine, null: false
      t.integer :price_per_bottle_in_cents, default: 0
      t.string :store
      t.string :town
      t.date :purchase_date, default: -> { 'CURRENT_TIMESTAMP' }
      t.boolean :gift, null: false, default: false
      t.text :comment

      t.timestamps
    end
  end
end
