class TransactionsController < ApplicationController

	def index

	end

	def create
		@gross_total = Transaction.save_information(params[:transaction][:attachment])
	end
end
