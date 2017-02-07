class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :quantity, null: false
      t.integer :item_id, null: false
      t.integer :merchant_id, null: false
      t.integer :customer_id, null: false
      t.integer :upload_id
      t.timestamps null: false
    end
    add_foreign_key :purchases, :items
    add_foreign_key :purchases, :merchants
    add_foreign_key :purchases, :customers
    add_foreign_key :purchases, :uploads
  end
end
