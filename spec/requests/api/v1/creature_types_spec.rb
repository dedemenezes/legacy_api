require 'rails_helper'

RSpec.describe "CreatureTypes", type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/creature_types'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      create(:human)
      get "/api/v1/creature_types/#{CreatureType.first.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
