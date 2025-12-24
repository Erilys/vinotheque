class CreateWines < ActiveRecord::Migration[8.1]
  def change
    create_table :wines do |t|
      t.string :name, null: false
      t.integer :year
      t.string :xl_id
      t.text :comment
      t.string :ticket
      t.string :aged
      t.integer :color, null: false, default: 0
      t.string :variety
      t.integer :volume
      t.float :titration
      t.boolean :organic
      t.string :bottling

      t.timestamps
    end
  end
end
