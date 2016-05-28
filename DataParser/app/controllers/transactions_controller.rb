class TransactionsController < ApplicationController

	def index

	end

	def create
		if params[:transaction]
			@gross_total = Transaction.save_information(params[:transaction][:attachment])
			render :index
		else
			flash[:error] = "You have to upload a file"
			redirect_to transactions_path
		end
	end
end
