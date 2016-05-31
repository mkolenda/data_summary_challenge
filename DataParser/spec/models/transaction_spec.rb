require 'rails_helper'

RSpec.describe Transaction, type: :model do
	let(:good_transaction) {FactoryGirl.build :transaction}
	let(:no_customer_id) {FactoryGirl.build :transaction, customer_id: ""}
	let(:no_product_id) {FactoryGirl.build :transaction, product_id: ""}
	let(:no_merchant_id) {FactoryGirl.build :transaction, merchant_id: ""}
	let(:no_total_price) {FactoryGirl.build :transaction, total_price: ""}
	let(:no_purchase_count) {FactoryGirl.build :transaction, purchase_count: ""}
	
	describe 'validations' do 
		context 'will raise an error' do 
			it 'when there is no customer id' do 
				no_customer_id.save
				expect(no_customer_id.errors[:customer_id]).to eq(["can't be blank"])
			end
			it 'when there is no product id' do 
				no_product_id.save
				expect(no_product_id.errors[:product_id]).to eq(["can't be blank"])
			end
			it 'when there is no merchant id' do 
				no_merchant_id.save
				expect(no_merchant_id.errors[:merchant_id]).to eq(["can't be blank"])
			end
			it 'when there is no total price' do 
				no_total_price.save
				expect(no_total_price.errors[:total_price]).to eq(["can't be blank"])
			end
			it 'when there is no purchase count' do 
				no_purchase_count.save
				expect(no_purchase_count.errors[:purchase_count]).to eq(["can't be blank"])
			end
		end
	end
	it 'successfully saves on a good merchant' do 
		expect{good_transaction.save}.to change{Transaction.count}.by(1)
	end
end
