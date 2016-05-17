class PurchasesController < ApplicationController

	def index
	end

	def upload
		data_file = params[:tab_file]
		if data_file
			upload_results = Purchase.upload(data_file.path)
			if upload_results[:success] 
				flash[:notice] = "Purchases successfully imported with a gross revenue of $#{upload_results[:gross_revenue]} and upload invoice id of #{upload_results[:upload_id]}."
			else
				flash[:notice] = "Something went wrong with upload invoice id #{upload_results[:upload_id]}. We have removed any associated purchases with this upload. Please try again or contact the site administrator."
			end
		else
			flash[:notice] = "No file was uploaded. Please try again."
		end
		redirect_to '/'
	end
end
