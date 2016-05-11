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
    context "when a valid file is submitted" do
      before(:each) { post :import, tsv_file: fixture_file_upload("example_input.tab", "text/tab-separated-values") }

      it "redirects to root" do
        expect(response).to redirect_to(root_path)
      end

      it "displays the gross revenue in a flash message" do
        expect(flash[:success]).to eq("Import succeeded! $95.00 in gross revenue for file.")
      end
    end

    context "when an invalid (non-tab delimited) file is submitted" do
      before(:each) { post :import, tsv_file: fixture_file_upload("invalid_example_input.tab", "text/tab-separated-values") }

      it "redirects to root" do
        expect(response).to redirect_to(root_path)
      end

      it "displays an alert message" do
        expect(flash[:alert]).to eq("Import failed. Make sure file has header row and columns delimited by tab characters.")
      end
    end

    context "when a file is not submitted" do
      before(:each) { post :import, tsv_file: nil }

      it "redirects to root" do
        expect(response).to redirect_to(root_path)
      end

      it "displays an alert message" do
        expect(flash[:alert]).to eq("Import failed. You must first choose a file.")
      end
    end
  end
end
