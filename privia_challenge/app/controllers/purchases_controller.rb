class PurchasesController < ApplicationController
  before_action :clear_database, only: :import

  def index
    @purchases = Purchase.all
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
