class AddItemPrice2ToDataImports < ActiveRecord::Migration
  def change
    add_column :data_imports, :item_price2, :string
  end
end
