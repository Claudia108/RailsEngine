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
    created_at = Merchant.first.created_at
    updated_at = Merchant.first.updated_at

    get :find, id: id, format: :json
    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal id, merchant["id"]
    assert_equal name, merchant["name"]

    get :find, name: name, format: :json
    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal id, merchant["id"]
    assert_equal name, merchant["name"]

    get :find, created_at: created_at, format: :json
    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal id, merchant["id"]
    assert_equal name, merchant["name"]

    get :find, updated_at: updated_at, format: :json
    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal id, merchant["id"]
    assert_equal name, merchant["name"]
  end

  test "can find all merchants" do
    id = Merchant.last.id
    name = Merchant.last.name
    created_at = Merchant.last.created_at
    updated_at = Merchant.last.updated_at

    get :find_all, id: id, format: :json
    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, merchant.count
    assert_equal id, merchant.first["id"]
    assert_equal name, merchant.first["name"]

    get :find_all, name: name, format: :json
    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal 3, merchant.count
    assert_equal id, merchant.first["id"]
    assert_equal name, merchant.first["name"]

    get :find_all, created_at: created_at, format: :json
    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, merchant.count
    assert_equal id, merchant.first["id"]
    assert_equal name, merchant.first["name"]

    get :find_all, updated_at: updated_at, format: :json
    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, merchant.count
    assert_equal id, merchant.first["id"]
    assert_equal name, merchant.first["name"]
  end

  # test "cna create a new item" do
  #   item_params = {name: "Screwdriver", description: "It's not just for breakfast"}
  #
  #   assert_difference 'Item.count', 1 do
  #     post :create, item: item_params, format: :json
  #   end
  #   assert_response :success
  #
  #   new_item = Item.last
  #   assert_equal item_params[:name], new_item.name
  #   assert_equal item_params[:description], new_item.description
  # end


end
