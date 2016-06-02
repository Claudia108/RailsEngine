require 'test_helper'

class Api::V1::Invoices::MerchantsControllerTest < ActionController::TestCase
  test "can visit show" do
    skip
    id = Invoice.first.id
    merchant = Invoice.first.merchant
    get "show", id: id, merchant: merchant, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, parsed_json.count
    assert parsed_json.first.has_key?("name")
  end
end
