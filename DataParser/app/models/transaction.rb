class Transaction < ActiveRecord::Base
	belongs_to :customer
	belongs_to :product
	belongs_to :merchant
	validates :merchant_id, :customer_id, :product_id, :purchase_count, :total_price, presence: true

	#method for parsing file
	def self.parse_file(file)
		parsed_data = CSV.read(file.path, {col_sep: "\t"})
		
		#preserve the headers

		headers = parsed_data.shift

		#iterate through array to fix price and product count
		parsed_data.map! do |element|
			element.each_with_index do |inner_element, inner_index|
				#index where price and product count are combined
				if inner_index == 2
					split_data = inner_element.split(" ") #split price and price count
					merchant_name = element[-1] #preserve merchant name
					address = element[inner_index + 1]
					element[inner_index] = split_data[0].to_f
					#move data down one index
					element[inner_index + 1] = split_data[1].to_i
					element[inner_index + 2] = address
					element[inner_index + 3] = merchant_name
				end
			end
		end

		#combine the information
		parsed_data.unshift(headers)
		#convert over to a hash for easier lookup and more clarity
		hash_info = [parsed_data.first].product(parsed_data.drop 1).map{|a| a.transpose.to_h}
		hash_info
	
	end

end
