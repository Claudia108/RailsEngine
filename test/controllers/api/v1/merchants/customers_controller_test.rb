require 'test_helper'

class Api::V1::Merchants::CustomersControllerTest < ActionController::TestCase
  test "can visit show" do
    id = Merchant.first.id
    get "show", id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, parsed_json.class
    assert parsed_json.has_key?("first_name")
  end

  test "can visit index" do
    id = Merchant.first.id
    get "index", id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_equal 1, parsed_json.count
    assert parsed_json.first.has_key?("first_name")
  end
end
