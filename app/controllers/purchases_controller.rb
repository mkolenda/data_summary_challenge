class PurchasesController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
    @revenue = Purchase.total_revenue
  end

  def import
    revenue = Purchase.import(params[:tsv_file].path)
    flash[:success] = "TSV imported! #{number_to_currency(revenue)} in gross revenue for file."
    redirect_to action: "index"
  end
end
