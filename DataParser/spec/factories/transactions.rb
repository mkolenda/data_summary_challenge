FactoryGirl.define do
  factory :transaction do
    customer_id 1
    product_id 1
    merchant_id 1
    total_price 20
    purchase_count 2
  end
end
