class Product < ActiveRecord::Base
	has_many :transactions
	has_many :customers, through: :transactions
	validates :description, :price, presence: true
end
