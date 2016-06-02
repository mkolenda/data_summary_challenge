class ChangePurchaseCountToInteger < ActiveRecord::Migration
  def change
    change_column :purchases, :purchase_count, :integer
  end
end
