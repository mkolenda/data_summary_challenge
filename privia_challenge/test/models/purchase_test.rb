require 'test_helper'

class PurchaseTest < Minitest::Test

  def setup
    @purchase = Purchase.create!(purchaser_name: "Snake Plissken",
                                item_description: "$10 off $20 of food",
                                item_price: 10.0,
                                purchase_count: 2,
                                merchant_address: "987 Fake St",
                                merchant_name: "Bob's Pizza")
  end
  #
  # def should_import_csv_file_with_all_fields_present
  #   @mock = Minitest::Mock.new
  #   @mock.save!
  #   raise
  #   # @mock.expect(purchaser_name: "Snake Plissken")
  #   assert_equal "Snake Plissken", @mock.purchaser_name
  #   assert @mock.verify
  # end

  def test_import
    # purchase = Purchase.create!(purchaser_name: "Example Name")
    # assert_equal "#{@purchase.id}-snake-plissken", @purchase.to_param
    assert @purchase.verify
  end

end
