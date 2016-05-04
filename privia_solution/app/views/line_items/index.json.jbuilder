json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :purchaser_name, :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name
  json.url line_item_url(line_item, format: :json)
end
