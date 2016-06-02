class ChangeItemPriceInPurchases < ActiveRecord::Migration
  def change
    def change
      change_column :purchases, :item_price, :decimal, precision: 20, scale: 2
    end
  end
end
