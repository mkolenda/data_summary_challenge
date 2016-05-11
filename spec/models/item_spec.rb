require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    let(:item) { build(:item) }

    context "without merchant" do
      it "is not valid" do
        item.merchant = nil
        expect(item).not_to be_valid
      end
    end

    context "without price" do
      it "is not valid" do
        item.price = nil
        expect(item).not_to be_valid
      end
    end

    context "without description" do
      it "is not valid" do
        item.description = nil
        expect(item).not_to be_valid
      end
    end    
  end
end
