class DataImport < ActiveRecord::Base
def self.import(file)
  require 'csv'

  db = []
  @upload_price = 0

  CSV.parse(file.read, {headers: true, col_sep: "\t"}) do |f|

  parsed_hash = f.to_hash

  db.push(parsed_hash)
  DataImport.create(purchaser_name:  parsed_hash["purchaser_name"],
                   item_description: parsed_hash["item_description"],
                   item_price2:      parsed_hash["item_price2"],
                   purchase_count:   parsed_hash["purchase_count"],
                   merchant_address: parsed_hash["merchant_address"],
                   merchant_name:    parsed_hash["merchant_name"],
  ) 
  end 
end 
end