FactoryGirl.define do
  factory :purchase do
    count  5
    purchaser
    item
  end
end
