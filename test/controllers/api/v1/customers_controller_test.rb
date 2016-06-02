require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "can visit index" do
    get "index", format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
    assert parsed_json.first.has_key?("first_name")
  end

  test "can visit show" do
    customer = customers(:one)
    id = customer.id
    name = customer.first_name

    get :show, id: id, format: :json
    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal id, customer["id"]
    assert_equal name, customer["first_name"]
  end

  test "can find a single customer" do
    customer = customers(:one)
    id = customer.id
    name = customer.first_name

    get :find, id: id, format: :json
    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal id, customer["id"]
    assert_equal name, customer["first_name"]
  end

  test "can find all merchants" do
    customer = customers(:one)
    id = customer.id
    name = customer.first_name

    get :find_all, id: id, format: :json
    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, customer.count
    assert_equal id, customer.first["id"]
    assert_equal name, customer.first["first_name"]
  end

  test "can find a random customer" do
    get :random, format: :json
    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, customer.class
    assert customer.has_key?("first_name")
    assert customer.has_key?("id")
  end
end
