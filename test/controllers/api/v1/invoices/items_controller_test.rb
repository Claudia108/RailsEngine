require 'test_helper'

class Api::V1::Invoices::ItemsControllerTest < ActionController::TestCase
  test "can visit index" do
    id = Invoice.first.id
    items = Invoice.first.items
    get "index", id: id, items: items, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, parsed_json.count
    assert parsed_json.first.has_key?("result")
    assert parsed_json.first.has_key?("credit_card_number")
  end
end
