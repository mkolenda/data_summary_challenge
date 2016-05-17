class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :customer_name, null: false
      t.integer :quantity, null: false
      t.integer :item_id, null: false
      t.integer :merchant_id, null: false
      t.timestamps null: false
    end
    add_foreign_key :purchases, :items
    add_foreign_key :purchases, :merchants
  end
end
