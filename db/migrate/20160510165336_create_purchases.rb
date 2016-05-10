class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :count
      t.belongs_to :purchaser, index: true
      t.belongs_to :item, index: true

      t.timestamps null: false
    end
  end
end
