class Purchase < ActiveRecord::Base
  # validates_presence_of :purchaser_name,
  #                       :item_description,
  #                       :item_price,
  #                       :purchase_count,
  #                       :merchant_address,
  #                       :merchant_name

  def self.import(file)
    CSV.foreach(file.path, :headers => true,
                           :header_converters => lambda { |h| h.downcase.gsub(' ', '_')},
                           :col_sep => "\t"
                           ) do |row|
      Purchase.create! row.to_hash
    end
  end
end
