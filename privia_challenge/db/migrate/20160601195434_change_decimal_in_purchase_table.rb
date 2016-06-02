class ChangeDecimalInPurchaseTable < ActiveRecord::Migration
  def change
    change_column :purchases, :item_price, :decimal, precision: 20, scale: 1
  end
end
