require "test_helper"

class CreatureTypesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'get index' do
    get '/api/v1/creature_types'

    assert_response 200
    assert_equal response.body, CreatureType.all.to_json
  end

  test 'get show' do
    type = creature_types(:human)
    get "/api/v1/creature_types/#{type.id}"

    assert_response 200
    assert_equal response.body, type.to_json
  end
end
