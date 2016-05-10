require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  describe "GET #index" do
    it "sets the revenue instance variable" do
      create(:purchase)
      get :index
      expect(assigns(:revenue)).to eq(25.00)
    end
  end

  describe "GET #new" do
    it "renders the template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "redirects to index" do
      file = fixture_file_upload("example_input.tab", "text/tab-separated-values")
      post :create, tsv_file: file
      expect(response).to redirect_to(purchases_path)
      expect(flash[:notice]).to eq("TSV imported! 95.0 Gross Revenue")
    end
  end
end
