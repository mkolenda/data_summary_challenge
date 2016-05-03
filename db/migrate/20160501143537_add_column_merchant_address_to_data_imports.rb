class AddColumnMerchantAddressToDataImports < ActiveRecord::Migration
  def change
    add_column :data_imports, :merchant_address, :string
  end
end
