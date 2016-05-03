class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :count
      t.references :item, index: true, foreign_key: true
      t.references :purchaser, index: true, foreign_key: true
      t.references :data_import, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
