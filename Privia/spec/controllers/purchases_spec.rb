require 'rails_helper'

RSpec.describe PurchasesController, :type => :controller do
  
  before :each do
    @complete_data_file = fixture_file_upload('files/complete_purchasing_data.tab', 'text/tab')
    @incomplete_data_file = fixture_file_upload('files/incomplete_purchasing_data.tab', 'text/tab')
  end

  it "can upload a complete tab-delimited data file multiple times" do
    post :upload, :tab_file => @complete_data_file
    expect(flash[:notice]).to eq("Purchases successfully imported with a gross revenue of $96.5 and upload invoice id of 1.")
    post :upload, :tab_file => @complete_data_file
    expect(flash[:notice]).to eq("Purchases successfully imported with a gross revenue of $96.5 and upload invoice id of 2.")
  end

  it "returns an error notice if no data file is uploaded" do
    post :upload, :tab_file => nil
    expect(flash[:notice]).to eq("No file was uploaded. Please try again.")
  end

  it "returns an error notice if incomplete data is uploaded" do
    post :upload, :tab_file => @incomplete_data_file
    expect(flash[:notice]).to eq("Something went wrong with upload invoice id 1. We have removed any associated purchases with this upload. Please try again or contact the site administrator.")
  end

  it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
  end
  
  it "renders the index template" do
      get :index
      expect(response).to render_template("index")
  end
end