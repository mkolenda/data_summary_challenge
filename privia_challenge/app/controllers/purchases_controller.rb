class PurchasesController < ApplicationController
  def index
  end

  def import
    Purchase.import(params[:file])
    redirect_to root_url, notice: "Purchases file imported."
  end
end
