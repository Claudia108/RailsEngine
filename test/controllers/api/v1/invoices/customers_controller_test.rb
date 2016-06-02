require 'test_helper'

class Api::V1::Invoices::CustomersControllerTest < ActionController::TestCase
  test "can visit show" do
    id = Invoice.first.id
    get "show", id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, parsed_json.class
    assert parsed_json.has_key?("first_name")
    assert parsed_json.has_key?("last_name")
  end
end
