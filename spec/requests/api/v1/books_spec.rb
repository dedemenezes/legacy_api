require 'rails_helper'

RSpec.describe "Api::V1::Books", type: :request do
  describe "GET #index" do

    before do
      create(:book)
      get '/api/v1/books'
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body).first
      expect(json_response.keys).to include("title")
      expect(json_response.keys).to include("image_url")
      expect(json_response.keys).to include("author")
    end
  end
end
