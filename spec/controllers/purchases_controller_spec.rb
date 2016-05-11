require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  describe "GET #index" do
    it "sets the revenue instance variable" do
      create(:purchase)
      get :index
      expect(assigns(:revenue)).to eq(25.00)
    end
  end

  describe "POST #import" do
    before(:each) { post :import, tsv_file: fixture_file_upload("example_input.tab", "text/tab-separated-values") }

    it "redirects to root" do
      expect(response).to redirect_to(root_path)
    end

    it "flashes the gross revenue on redirect" do
      expect(flash[:success]).to eq("TSV imported! $95.00 in gross revenue for file.")
    end
  end
end
