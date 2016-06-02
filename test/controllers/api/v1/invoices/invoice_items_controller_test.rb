require 'test_helper'

class Api::V1::Invoices::InvoiceItemsControllerTest < ActionController::TestCase
  test "can visit index" do
    invoice_id = InvoiceItem.first.invoice_id

    get "index", id: invoice_id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, parsed_json.count
    assert parsed_json.first.has_key?("quantity")
    assert parsed_json.first.has_key?("unit_price")
  end
end
