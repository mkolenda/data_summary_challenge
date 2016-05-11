require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe ".import" do
    let(:process) { Purchase.import(Rails.root.join("spec/fixtures/example_input.tab")) }

    it "creates the new records" do
      expect { process }.to change(Purchase, :count).from(0).to(4)
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
