class AddImportToLineItem < ActiveRecord::Migration
  def change
    add_reference :line_items, :import, index: true, foreign_key: true
  end
end
