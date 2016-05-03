class DataImportsController < ApplicationController
  def index
    @data_import = DataImport.all
  end

  def import
    DataImport.import(params[:file])
    redirect_to root_url, notice: "Data has been imported!"
  end

end