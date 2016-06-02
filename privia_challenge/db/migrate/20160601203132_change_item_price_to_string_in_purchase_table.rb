class ChangeItemPriceToStringInPurchaseTable < ActiveRecord::Migration
  def change
    change_column :purchases, :item_price, :string
  end
end
