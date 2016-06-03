require 'test_helper'

class Api::V1::Transactions::InvoicesControllerTest < ActionController::TestCase
  test "can visit show" do
    id = Transaction.first.id
    get "show", id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, parsed_json.class
    assert parsed_json.has_key?("status")
    assert parsed_json.has_key?("merchant_id")
  end
end
