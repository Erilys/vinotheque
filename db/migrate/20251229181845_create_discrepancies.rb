class CreateDiscrepancies < ActiveRecord::Migration[8.1]
  def change
    create_table :discrepancies do |t|
      t.integer :quantity, null: false
      t.references :location, null: false, foreign_key: true
      t.references :wine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
