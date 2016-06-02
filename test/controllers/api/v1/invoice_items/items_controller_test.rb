require 'test_helper'

class Api::V1::InvoiceItems::ItemsControllerTest < ActionController::TestCase
  test "can visit show" do
    skip
    id = InvoiceItem.first.id
    item = InvoiceItem.first.item
    get "show", id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, parsed_json.count
    assert parsed_json.first.has_key?("result")
    assert parsed_json.first.has_key?("credit_card_number")
  end
end