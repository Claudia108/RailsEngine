require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "can visit index" do
    get "index", format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 5, parsed_json.count
    assert parsed_json.first.has_key?("name")
  end

  test "can visit show" do
    id = Merchant.first.id
    name = Merchant.first.name

    get :show, id: id, format: :json
    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal id, merchant["id"]
    assert_equal name, merchant["name"]
  end

  test "can find a single merchant" do
    id = Merchant.first.id
    name = Merchant.first.name

    get :find, id: id, format: :json
    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal id, merchant["id"]
    assert_equal name, merchant["name"]
  end

  test "can find all merchants" do
    id = Merchant.first.id
    name = Merchant.first.name

    get :find_all, id: id, format: :json
    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, merchant.count
    assert_equal id, merchant.first["id"]
    assert_equal name, merchant.first["name"]
  end

  test "can find a random merchant" do
    get :random, format: :json
    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, merchant.class
    assert merchant.has_key?("name")
    assert merchant.has_key?("id")
  end
end
