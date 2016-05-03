class AddColumnPurchaserNameToDataImport < ActiveRecord::Migration
  def change
    add_column :data_imports, :purchaser_name, :string
  end
end
