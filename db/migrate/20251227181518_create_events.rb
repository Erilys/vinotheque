class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.date :start_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.date :end_date
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
