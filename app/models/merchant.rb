class Merchant < ActiveRecord::Base
  has_many :items

  validates :name, :address, presence: true
end
