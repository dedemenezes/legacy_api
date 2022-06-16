require 'rails_helper'

RSpec.describe 'Api::V1::Members', type: :request do
  let(:member) { create(:harry_gryffindor) }
  before do
    get "/api/v1/houses/#{member.house.name.downcase}/members"
    @subject = response.parsed_body
  end

  describe 'GET /index' do
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns correct json' do
      expect(@subject).to be_a(Hash)
      expect(@subject.keys).to include('members').and include('house')
      expect(@subject['house']).to eq(House.first.name)
    end
  end
end
