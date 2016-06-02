require 'test_helper'

class Api::V1::Invoices::CustomersControllerTest < ActionController::TestCase
  test "can visit show" do
    skip
    id = Invoice.first.id
    customer = Invoice.first.customer
    get "show", id: id, customer: customer, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, parsed_json.count
    assert parsed_json.first.has_key?("result")
    assert parsed_json.first.has_key?("credit_card_number")
  end
end
