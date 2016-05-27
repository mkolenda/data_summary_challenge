require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:good_customer) {FactoryGirl.build :customer}
  let(:no_name) {FactoryGirl.build :customer, name: ""}
	describe 'validations' do 
		context 'will raise an error' do 
			it 'when there is no name' do 
				no_name.save
				expect(no_name.errors[:name]).to eq(["can't be blank"])
			end
		end
	end
	it "successfully saves on a good user" do 
		expect{good_customer.save}.to change{Customer.count}.by(1)
	end
end
