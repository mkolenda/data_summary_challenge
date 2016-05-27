class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
    	t.references :customer, null: false
    	t.references :product, null: false
    	t.references :merchant, null: false
    	t.float :total_price, null: false
    	t.integer :purchase_count, null: false
    	t.timestamps null: false
    end
  end
end
