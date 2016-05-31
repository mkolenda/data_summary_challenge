require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
	
	describe '#index' do 
		it 'should load file upload form' do 
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe '#create' do 
		it 'will render the index page after upload' do 
			post :create, transaction: {attachment: fixture_file_upload('files/example_input.tab', 'text/csv')}
			expect(response).to render_template(:index)
		end

		it 'creates 3 new customers and changes the count by 3' do 
			expect{post :create, transaction: {attachment: fixture_file_upload('files/example_input.tab', 'text/csv')}}.to change{Customer.count}.by(3)
		end

		it 'creates 3 new merchants and changes the count by 3' do 
			expect{post :create, transaction: {attachment: fixture_file_upload('files/example_input.tab', 'text/csv')}}.to change{Merchant.count}.by(3)
		end

		it 'creates 4 new transactions and changes the count by 4' do 
			expect{post :create, transaction: {attachment: fixture_file_upload('files/example_input.tab', 'text/csv')}}.to change{Transaction.count}.by(4)
		end

		it 'creates 4 new products and changes the count by 4' do 
			expect{post :create, transaction: {attachment: fixture_file_upload('files/example_input.tab', 'text/csv')}}.to change{Product.count}.by(4)
		end
	end
end
