require "csv"

class Purchase < ActiveRecord::Base
	belongs_to :merchant
	belongs_to :customer
	belongs_to :item
	belongs_to :upload

	def self.upload(data_file_path)
		upload = Upload.create
		upload_results = {gross_revenue: 0, success: true, upload_id: upload.id}
		CSV.foreach(data_file_path, {headers: true, col_sep: "\t" }) do |row|
			merchant = Merchant.find_or_create_by(name: row["merchant name"].strip.downcase, 
				                                  address: row["merchant address"].strip.downcase)
			item = Item.find_or_create_by(price: row["item price"].strip, 
				                          description: row["item description"].strip.downcase)
			customer = Customer.find_or_create_by(name: row["purchaser name"].strip.downcase)
			purchase = Purchase.create(customer_id: customer.id, 
									   quantity: row["purchase count"].strip, 
									   merchant_id: merchant.id, 
									   item_id: item.id,
									   upload_id: upload.id)
			upload_results[:gross_revenue] += item.price*purchase.quantity
		end
		upload_results
		rescue
			upload_results[:success] = false
			upload.purchases.destroy_all
			upload_results[:gross_revenue] = 0
			upload_results
	end
end
