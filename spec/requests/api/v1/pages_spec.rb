require 'rails_helper'

RSpec.describe "Api::V1::Pages", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/api/v1/"
      expect(response).to have_http_status(:success)
    end
  end

end
