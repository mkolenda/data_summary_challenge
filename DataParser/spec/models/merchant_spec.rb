require 'rails_helper'

RSpec.describe Merchant, type: :model do
  	let(:good_merchant) {FactoryGirl.build :merchant}
	let(:no_name) {FactoryGirl.build :merchant, name: ""}
	let(:no_address) {FactoryGirl.build :merchant, address: ""}
	describe 'validations' do 
		context 'will raise an error' do 
			it 'when there is no name' do 
				no_name.save
				expect(no_name.errors[:name]).to eq(["can't be blank"])
			end
			it 'when there is no address' do 
				no_address.save
				expect(no_address.errors[:address]).to eq(["can't be blank"])
			end
		end
	end
	it "successfully saves on a good merchant" do 
		expect{good_merchant.save}.to change{Merchant.count}.by(1)
	end
end
