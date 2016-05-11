require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe "validations" do
    let(:purchase) { build(:purchase) }

    context "without an Item" do
      it "is not valid" do
        purchase.item = nil
        expect(purchase).not_to be_valid
      end
    end

    context "without a Purchaser" do
      it "is not valid" do
        purchase.purchaser = nil
        expect(purchase).not_to be_valid
      end
    end
  end

  describe ".import" do
    let(:process) { Purchase.import(Rails.root.join("spec/fixtures/example_input.tab")) }

    it "creates new Purchases" do
      expect { process }.to change(Purchase, :count).from(0).to(4)
    end

    it "creates new Purchasers" do
      expect { process }.to change(Purchaser, :count).from(0).to(3)
    end

    it "creates new Items" do
      expect { process }.to change(Item, :count).from(0).to(3)
    end

    it "creates new Merchants" do
      expect { process }.to change(Merchant, :count).from(0).to(3)
    end

    it "creates correct associations between the records" do
      process
      purchase = Purchase.first
      expect(purchase).to have_attributes(count: 2)
      expect(purchase.purchaser).to have_attributes(name: "Snake Plissken")
      expect(purchase.item).to have_attributes(description: "$10 off $20 of food")
      expect(purchase.item.merchant).to have_attributes(name: " Bob's Pizza", address: "987 Fake St")
    end

    it "returns the gross revenue for the file" do
      expect(process).to eq(95.00)
    end
  end

  describe ".total_revenue" do
    it "returns total revenue for all purchases" do
      create_list(:purchase, 10)
      expect(Purchase.total_revenue).to eq(250.0)
    end
  end

  describe "#total" do
    it "returns the total cost of the purchase" do
      purchase = create(:purchase)
      expect(purchase.total).to eq(25.00)
    end
  end
end
