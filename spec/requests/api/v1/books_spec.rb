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

    it "JSON body response contains all books attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response).to be_an(Array)
      keys = json_response.first.keys
      expect(keys).to include("title").and include("image_url").and include("author")
    end
  end
end
