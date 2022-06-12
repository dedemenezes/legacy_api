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
        create(:jk_author)
        get '/api/v1/books'
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns expected json to all books' do
        json_response = response.parsed_body
        expect(json_response).to be_an(Array)

        actual = json_response.first.keys
        expect(actual).to contain_exactly('author', 'id', 'image_url', 'release_date', 'title')
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
        book_artist = create(:jk_author)
        get "/api/v1/books/#{book_artist.book.id}"
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'JSON body response contains expected book attributes' do
        # json_response = JSON.parse()
        subject = response.parsed_body
        expect(subject).to be_an(Hash)
        expect(subject.empty?).to be_falsey

        book = Book.new
        subject.each_key do |response_key|
          expect(book).to respond_to(response_key)
        end
        # subject.keys.each { |key| expect(attributes.include?(key)).to be_truthy }
      end
    end
  end
end
