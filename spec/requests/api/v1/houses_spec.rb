# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Houses', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/houses'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      create(:gryffindor)
      get "/api/v1/houses/#{House.first.name}"
      expect(response).to have_http_status(:success)
    end
  end
end
