class CreateDataImports < ActiveRecord::Migration
  def change
    create_table :data_imports do |t|
      t.decimal :revenue

      t.timestamps null: false
    end
  end
end
