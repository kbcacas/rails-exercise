class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.integer :inventory_quantity
      t.datetime :inventory_updated_time
      t.references :store, null: false

      t.timestamps
    end
  end
end
