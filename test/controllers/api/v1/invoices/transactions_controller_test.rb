require 'test_helper'

class Api::V1::Invoices::TransactionsControllerTest < ActionController::TestCase
  test "can visit index" do
    invoice_id = Transaction.first.invoice_id

    get "index", id: invoice_id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
    assert parsed_json.first.has_key?("result")
    assert parsed_json.first.has_key?("credit_card_number")
  end
end
