require 'test_helper'

class Api::V1::Items::MerchantsControllerTest < ActionController::TestCase
  test "can visit show" do
    id = Item.first.id
    get "show", id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, parsed_json.class
    assert parsed_json.has_key?("name")
  end
end
