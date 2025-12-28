class CreateStocks < ActiveRecord::Migration[8.1]
  def change
    create_view :stocks, materialized: true

    add_index :stocks, :wine_id
  end
end
