class Transaction < ActiveRecord::Base
	belongs_to :customer
	belongs_to :product
	belongs_to :merchant
	validates :merchant_id, :customer_id, :product_id, :purchase_count, :total_price, presence: true


	#method to save information to database and return gross total of document
	def self.save_information(file)
		#call upon parse_file
		hash_info = self.parse_file(file)
		gross_total = 0
		#iterate through hash to retrieve data
		hash_info.each do |key|
			#keep total price of each transaction
			total_price_of_transaction = 0
			#use count to perform a times loop
			key["purchase count"].times do 
				total_price_of_transaction += key["item price"]
			end
			#find_or_create by to avoid duplicates 
			customer = Customer.find_or_create_by(name: key['purchaser name'])
			product = Product.create(description: key['item description'], price: key['item price'])
			merchant = Merchant.find_or_create_by(name: key['merchant name'], address: key['merchant address'])
			transaction = Transaction.create(customer_id: customer.id, product_id: product.id, merchant_id: merchant.id, purchase_count: key['purchase count'], total_price: total_price_of_transaction)
			gross_total += total_price_of_transaction
		end

		#return the gross total of document
		return gross_total
	end

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
