# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Books', type: :request do
  describe 'GET #index' do
    context 'when database is empty' do
      it 'returns http status no content when no book in the db' do
        get '/api/v1/books'
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when datbase has records' do
      before do
        create(:book)
        get '/api/v1/books'
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'JSON body response contains all books attributes' do
        json_response = JSON.parse(response.body)
        expect(json_response).to be_an(Array)
        keys = json_response.first.keys
        expect(keys).to include('title').and include('image_url').and include('author')
      end
    end
  end

  describe 'GET #show' do
    context 'when database is empty' do
      it 'returns http status no content when no book in the db' do
        get '/api/v1/books/1'
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when datbase has records' do
      before do
        create(:book)
        get '/api/v1/books/1'
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'JSON body response contains expected book attributes' do
        json_response = JSON.parse(response.body)
        expect(json_response).to be_an(Hash)
        keys = json_response.keys
        expect(keys).to include('title').and include('image_url').and include('author')
      end
    end
  end
end
