require 'test_helper'

class Api::V1::Merchants::RevenueControllerTest < ActionController::TestCase
  test "can visit index" do
    quantity = 2
    get "index", quantity: quantity, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
    assert parsed_json.first.has_key?("name")
  end

  test "can visit revenue by date" do
    date = "2012-03-26 13:55:41"

    get "revenue_by_date", date: date, format: :json
    parsed_json = JSON.parse(response.body)

    assert_equal ({"total_revenue"=>"4.02"}), parsed_json
  end

  test "can visit show with given date" do
    id = Merchant.first.id
    date = "2012-03-26 13:55:41"

    get "show", id: id, date: date, format: :json
    parsed_json = JSON.parse(response.body)

    assert_equal ({ "revenue" => "4.02"}), parsed_json
  end

  test "can visit show with no date" do
    id = Merchant.first.id
    
    get "show", id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_equal ({ "revenue" => "4.02"}), parsed_json
  end
end
