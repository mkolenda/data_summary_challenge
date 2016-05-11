require "csv"

class Purchase < ActiveRecord::Base
  belongs_to :purchaser
  belongs_to :item

  validates :purchaser, :item, presence: true

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
  
  def self.total_revenue
    joins(:item).select("SUM(purchases.count * items.price) AS total_revenue").first.total_revenue || 0.00
  end

  def total
    count * item.price
  end
end
