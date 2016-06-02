class ChangeItemPriceInPurchaseTable < ActiveRecord::Migration
  def change
    change_column :purchases, :item_price, :decimal, precision: 20, scale: 2
  end
end
