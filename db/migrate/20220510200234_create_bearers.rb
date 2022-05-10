class CreateBearers < ActiveRecord::Migration[6.1]
  def change
    create_table :bearers do |t|
      t.string :name
      t.boolean :deleted, default: false

      t.timestamps
    end
    add_index :bearers, :name
  end
end
