class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :purchaser_name
      t.text :item_description
      t.integer :item_price
      t.integer :purchase_count
      t.string :merchant_address
      t.string :merchant_name

      t.timestamps null: false
    end
  end
end
