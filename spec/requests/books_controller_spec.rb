# spec/controllers/books_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do
  describe 'GET #index' do
    let(:library) { create(:library) }
    let!(:books) { create_list(:book, 3, library: library) }

    it 'returns a list of books for the specified library' do
      get :index, params: { library_id: library.id }

      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)

      expect(json_response.size).to eq(3)
      books.each_with_index do |book, index|
        expect(json_response[index]['title']).to eq(book.title)
      end
    end

    it 'returns a 404 status if the library is not found' do
      get :index, params: { library_id: 999 }

      expect(response).to have_http_status(:not_found)
    end
  end
end
