class Purchase < ActiveRecord::Base
  validates_presence_of :purchaser_name,
                        :item_description,
                        :item_price,
                        :purchase_count,
                        :merchant_address,
                        :merchant_name


  CONVERTER_SPLIT_PRICE_COUNT = lambda do |value, info|
    value = value.lstrip if value.is_a? String
    next value unless info.header == "item_price"
    item_price, purchase_count = value.split
    [ item_price.to_f, purchase_count.to_i ]
  end

  def self.import(file)

    csv_opts = {
      headers: true,
      col_sep: "\t",
      header_converters: ->(h) { h.downcase.tr(" ", "_") },
      converters: CONVERTER_SPLIT_PRICE_COUNT
    }

    data_out = CSV.foreach(file.path, csv_opts).map do |row|
      fields_flattened = row.fields.flatten
      row.headers.zip(fields_flattened).to_h
    end

    Purchase.create!(data_out)

  end

end
