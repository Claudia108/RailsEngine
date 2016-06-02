require 'test_helper'

class Api::V1::Merchants::InvoicesControllerTest < ActionController::TestCase
  test "can visit index" do
    merchant_id = Invoice.first.merchant_id

    get "index", id: merchant_id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, parsed_json.count
    assert parsed_json.first.has_key?("status")
  end
end
