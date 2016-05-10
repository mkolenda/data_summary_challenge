require "csv"

class Purchase < ActiveRecord::Base
  belongs_to :purchaser
  belongs_to :item

  validates_presence_of :purchaser
  validates_presence_of :item

  def self.import(file_name)
    revenue = 0
    CSV.foreach(file_name, { headers: true, col_sep: "\t" }) do |row|
      merchant = Merchant.find_or_create_by(address: row["merchant address"], name: row["merchant name"])
      item = Item.find_or_create_by(description: row["item description"], price: row["item price"], merchant: merchant)
      purchaser = Purchaser.find_or_create_by(name: row["purchaser name"])
      revenue += create(count: row["purchase count"], item: item, purchaser: purchaser).total
    end
    revenue
  end

  def total
    (count * item.price).to_f
  end
end
