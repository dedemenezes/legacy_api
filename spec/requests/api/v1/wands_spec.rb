# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Wands', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/wands'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      create(:wand)
      get "/api/v1/wands/#{Wand.first.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
