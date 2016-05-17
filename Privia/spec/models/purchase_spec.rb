require 'rails_helper'

RSpec.describe Purchase, :type => :model do

  before do
  	@complete_file_path = './spec/fixtures/files/complete_purchasing_data.tab'
  	@incomplete_file_path = './spec/fixtures/files/incomplete_purchasing_data.tab'
  end

  it "imports data when the upload is called with a complete tab-delimited data file argument" do
    upload_results = Purchase.upload(@complete_file_path)
    expect(upload_results[:gross_revenue]).to eq(96.5)
    expect(upload_results[:success]).to eq(true)
    expect(Purchase.count).to eq(4)
    expect(Merchant.count).to eq(3)
    expect(Item.count).to eq(3)
    expect(Customer.count).to eq(3)
    expect(Upload.count).to eq(1)
    expect(Merchant.where(name: "sneaker store emporium").first.purchases.count).to eq(2)
    expect(Item.where(description: "$20 sneakers for $5").first.purchases.count).to eq(2)
  end

  it "does not create any new purchases and returns false for success when the upload is called with incomplete data" do
  	upload_results = Purchase.upload(@incomplete_file_path)
  	expect(upload_results[:gross_revenue]).to eq(0)
    expect(upload_results[:success]).to eq(false)
    expect(Purchase.count).to eq(0)
  end

  it "does not create new merchants, customers, or items for multiple uploads with duplicate attributes." do
  	upload_results = Purchase.upload(@complete_file_path)
  	upload_results2 = Purchase.upload(@complete_file_path)
  	upload_results3 = Purchase.upload(@incomplete_file_path)
  	expect(upload_results2[:gross_revenue]).to eq(96.5)
    expect(upload_results2[:success]).to eq(true)
  	expect(Purchase.count).to eq(8)
    expect(Merchant.count).to eq(3)
    expect(Item.count).to eq(3)
    expect(Customer.count).to eq(3)
    expect(Upload.count).to eq(3)
  end
end
