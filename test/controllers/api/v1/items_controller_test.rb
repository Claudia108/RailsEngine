require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "can visit index" do
    get "index", format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
    assert parsed_json.first.has_key?("name")
    assert parsed_json.first.has_key?("description")
  end

  test "can visit show" do
    item = items(:one)
    id = item.id
    name = item.name

    get :show, id: id, format: :json
    item = JSON.parse(response.body)

    assert_response :success
    assert_equal id, item["id"]
    assert_equal name, item["name"]
  end

  test "can find a single item" do
    item = items(:one)
    id = item.id
    name = item.name

    get :find, id: id, format: :json
    item = JSON.parse(response.body)

    assert_response :success
    assert_equal id, item["id"]
    assert_equal name, item["name"]
  end

  test "can find all merchants" do
    item = items(:one)
    id = item.id
    name = item.name

    get :find_all, id: id, format: :json
    item = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, item.count
    assert_equal id, item.first["id"]
    assert_equal name, item.first["name"]
  end

  test "can find a random item" do
    get :random, format: :json
    item = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, item.class
    assert item.has_key?("name")
    assert item.has_key?("id")
  end
end
