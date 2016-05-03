class AddColumnMerchantNameToDataImports < ActiveRecord::Migration
  def change
    add_column :data_imports, :merchant_name, :string
  end
end
