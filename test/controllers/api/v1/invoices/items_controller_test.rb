require 'test_helper'

class Api::V1::Invoices::ItemsControllerTest < ActionController::TestCase
  test "can visit index" do
    id = Invoice.first.id
    get "index", id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, parsed_json.count
    assert parsed_json.first.has_key?("name")
    assert parsed_json.first.has_key?("description")
  end
end
