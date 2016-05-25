class Purchase < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, :headers => true,
                           :header_converters => lambda { |h| h.downcase.gsub(' ', '_')},
                           :col_sep => "\t"
                           ) do |row|
      Purchase.create! row.to_hash
    end
  end
end
