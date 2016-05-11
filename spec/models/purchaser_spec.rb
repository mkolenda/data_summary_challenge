require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  describe "validations" do
    let(:purchaser) { build(:purchaser) }

    context "without a name" do
      it "is not valid" do
        purchaser.name = nil
        expect(purchaser).not_to be_valid
      end
    end
  end
end
