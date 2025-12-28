class CreateDrinks < ActiveRecord::Migration[8.1]
  def change
    create_table :drinks do |t|
      t.references :event
      t.references :wine, null: false
      t.references :location
      t.integer :quantity, null: false, default: 1
      t.integer :note
      t.text :comment

      t.timestamps
    end
  end
end
