class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.decimal :price, precision: 16, scale: 2
      t.belongs_to :merchant, index: true

      t.timestamps null: false
    end
  end
end
