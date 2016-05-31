class Merchant < ActiveRecord::Base
	has_many :transactions
	has_many :customers, through: :transactions
	validates :name, :address, presence: true
end
