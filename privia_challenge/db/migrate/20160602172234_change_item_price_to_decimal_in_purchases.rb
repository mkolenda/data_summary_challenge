class ChangeItemPriceToDecimalInPurchases < ActiveRecord::Migration
  def change
    change_column :purchases, :item_price, :decimal, precision: 15, scale: 2
  end
end
