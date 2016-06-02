class ChangeCountInPurchaseTable < ActiveRecord::Migration
  def change
    change_column :purchases, :purchase_count, :string
  end
end
