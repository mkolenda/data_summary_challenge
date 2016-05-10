class PurchasesController < ApplicationController
  def index
    total_revenue = 0
    Purchase.all.each { |purchase| total_revenue += purchase.total }
    @revenue = total_revenue
  end

  def new
  end

  def create
    revenue = Purchase.import(params[:tsv_file].path)
    flash[:notice] = "TSV imported! #{revenue} Gross Revenue"
    redirect_to action: "index"
  end
end
