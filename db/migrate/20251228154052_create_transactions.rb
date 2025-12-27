class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.integer :quantity
      t.references :wine, null: false, index: true
      t.references :location
      t.string :source_type
      t.references :source, index: true

      t.timestamps
    end
  end
end
