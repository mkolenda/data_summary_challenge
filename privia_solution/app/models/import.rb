class Import < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  require 'csv'


  def self.import(file)
    import = Import.create!
    CSV.foreach(file.path, {headers: true, col_sep: "\t"} ) do |row|
        import_row = row.to_hash
        import.line_items.create(
        purchaser_name: import_row["purchaser name"],
        item_description: import_row["item description"],
        item_price: import_row["item price"],
        purchase_count: import_row["purchase count"],
        merchant_address: import_row["merchant address"],
        merchant_name: import_row["merchant name"]
        )
    end # end CSV.foreach
  end # end self.import(file)

end
