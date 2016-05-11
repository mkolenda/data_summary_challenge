class AddNullConstraints < ActiveRecord::Migration
  def change
    change_column_null(:items, :price, false)
    change_column_null(:items, :description, false)
    change_column_null(:items, :merchant_id, false)
    
    change_column_null(:merchants, :name, false)
    change_column_null(:merchants, :address, false)
    
    change_column_null(:purchasers, :name, false)
    change_column_null(:purchases, :count, false)
    change_column_null(:purchases, :purchaser_id, false)
    change_column_null(:purchases, :item_id, false)
  end
end
