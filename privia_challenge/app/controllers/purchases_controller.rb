class PurchasesController < ApplicationController
  helper TotalRevenueHelper

  before_action :clear_database, only: :import

  def index
    @purchases = Purchase.all
    @total_revenue
  end

  def import
    Purchase.import(params[:file])
    redirect_to root_url, notice: "Purchases file imported."
  end

private
def clear_database
  Purchase.destroy_all
end

end
