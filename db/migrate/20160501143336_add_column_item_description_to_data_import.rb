class AddColumnItemDescriptionToDataImport < ActiveRecord::Migration
  def change
    add_column :data_imports, :item_description, :string
  end
end
