require 'test_helper'

class Api::V1::Items::InvoiceItemsControllerTest < ActionController::TestCase
  test "can visit index" do
    item_id = InvoiceItem.first.item_id

    get "index", id: item_id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, parsed_json.count
    assert parsed_json.first.has_key?("quantity")
    assert parsed_json.first.has_key?("unit_price")
  end
end
