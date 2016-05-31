require 'rails_helper'

RSpec.describe Product, type: :model do
	let(:good_product) {FactoryGirl.build :product}
	let(:no_description) {FactoryGirl.build :product, description: ""}
	let(:no_price) {FactoryGirl.build :product, price: ""}

	describe 'validations' do 
		context 'will raise an error' do
			it 'when there is no description' do 
				no_description.save
				expect(no_description.errors[:description]).to eq(["can't be blank"])
			end
			it 'when there is no price' do 
				no_price.save
				expect(no_price.errors[:price]).to eq(["can't be blank"])
			end
		end
	end

	it 'successfully saves on a good product' do 
		expect{good_product.save}.to change{Product.count}.by(1)
	end
end
