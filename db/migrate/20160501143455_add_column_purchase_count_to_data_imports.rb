class AddColumnPurchaseCountToDataImports < ActiveRecord::Migration
  def change
    add_column :data_imports, :purchase_count, :integer
  end
end
