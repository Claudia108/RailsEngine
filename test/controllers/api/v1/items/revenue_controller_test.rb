require 'test_helper'

class Api::V1::Items::RevenueControllerTest < ActionController::TestCase
  test "can visit index" do
    quantity = 2
    get "index", quantity: quantity, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
    assert parsed_json.first.has_key?("name")
  end

  test "can visit most_items" do
    quantity = 2
    get "most_items", quantity: quantity, format: :json
    parsed_json = JSON.parse(response.body)

    assert_equal 2, parsed_json.count
    assert parsed_json.first.has_key?("name")
  end

  test "can visit best_day" do
    id = Item.first.id
    get "best_day", id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_equal ({ "best_day" => "2012-03-26T13:55:41.000Z"}), parsed_json
  end
end
