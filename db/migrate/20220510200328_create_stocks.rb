class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.integer :bearer_id
      t.boolean :deleted, default: false

      t.timestamps
    end
    add_index :stocks, :name
  end
end
