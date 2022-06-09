# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Characters', type: :request do
  describe 'GET /index' do
    context 'when datbase has records' do
      before do
        create(:harry)
        create(:wand_master)
        get '/api/v1/characters'
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'JSON body response contains all books attributes' do
        json_response = JSON.parse(response.body)
        expect(json_response).to be_an(Array)
        keys = json_response.first.keys
        expect(keys).to include('born').and include('species').and include('eyes')
      end
    end
  end
end
