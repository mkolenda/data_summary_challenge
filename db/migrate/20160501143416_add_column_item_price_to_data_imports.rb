class AddColumnItemPriceToDataImports < ActiveRecord::Migration
  def change
    add_column :data_imports, :item_price, :decimal
  end
end
