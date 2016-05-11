require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "without a Merchant" do
    it "is not valid" do
      item = Item.new(description: "A cool thing", price: 3.99, merchant: nil)
      expect(item).not_to be_valid
    end
  end
end
