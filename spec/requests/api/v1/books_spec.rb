# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Books', type: :request do
  describe 'GET #index' do
    context 'when database is empty' do
      it 'returns http status no content when no book in the db' do
        Book.destroy_all
        get '/api/v1/books'
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when datbase has records' do
      before do
        create(:book_one)
        get '/api/v1/books'
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns expected json to all books' do
        json_response = response.parsed_body
        expect(json_response).to be_an(Array)

        actual = json_response.first.keys
        expect(actual).to contain_exactly('title', 'author', 'image_url', 'pages', 'release_date')
      end
    end
  end

  describe 'GET #show' do
    context 'when database is empty' do
      it 'returns http status not found when no book in the db' do
        Book.destroy_all
        get '/api/v1/books/1'
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when datbase has records' do
      before do
        create(:book_one)
        get "/api/v1/books/#{Book.first.id}"
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'JSON body response contains expected book attributes' do
        # json_response = JSON.parse()
        subject = response.parsed_body
        expect(subject).to be_an(Hash)
        expect(subject.empty?).to be_falsey

        attributes = Book.new.attributes
        subject.keys.each do |response_key|
          expect(attributes.keys).to include(response_key)
        end
        # subject.keys.each { |key| expect(attributes.include?(key)).to be_truthy }
      end
    end
  end
end
