class Transaction < ActiveRecord::Base
	belongs_to :customer
	belongs_to :product
	belongs_to :merchant
	validates :merchant_id, :customer_id, :product_id, :purchase_count, :total_price, presence: true
end
