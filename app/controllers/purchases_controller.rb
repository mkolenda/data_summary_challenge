class PurchasesController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
    @revenue = Purchase.total_revenue
  end

  def import
    if params[:tsv_file].present?
      begin
        revenue = Purchase.import(params[:tsv_file].path)
        flash[:success] = "Import succeeded! #{number_to_currency(revenue)} in gross revenue for file."
      rescue ActiveRecord::RecordInvalid, ActiveRecord::StatementInvalid
        flash[:alert] = "Import failed. Make sure file has header row and columns delimited by tab characters."
      end
    else
      flash[:alert] = "Import failed. You must first choose a file."
    end
    redirect_to action: "index"
  end
end
