require 'test_helper'

class Api::V1::Merchants::ItemsControllerTest < ActionController::TestCase
  test "can visit index" do
    merchant_id = Item.first.merchant_id

    get "index", id: merchant_id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
    assert parsed_json.first.has_key?("name")
  end
end
