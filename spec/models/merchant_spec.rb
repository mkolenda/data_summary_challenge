require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "validations" do
    let(:merchant) { build(:merchant) }

    context "without name" do
      it "is not valid" do
        merchant.name = nil
        expect(merchant).not_to be_valid
      end
    end

    context "without address" do
      it "is not valid" do
        merchant.address = nil
        expect(merchant).not_to be_valid
      end
    end
  end
end
