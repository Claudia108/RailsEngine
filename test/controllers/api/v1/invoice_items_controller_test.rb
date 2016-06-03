require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "can visit index" do
    get "index", format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
    assert parsed_json.first.has_key?("id")
    assert parsed_json.first.has_key?("quantity")
  end

  test "can visit show" do
    id = InvoiceItem.first.id
    quantity = InvoiceItem.first.quantity

    get :show, id: id, format: :json
    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal id, invoice_item["id"]
    assert_equal quantity, invoice_item["quantity"]
  end

  test "can find a single invoice_item" do
    id = InvoiceItem.first.id
    quantity = InvoiceItem.first.quantity

    get :find, id: id, format: :json
    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal id, invoice_item["id"]
    assert_equal quantity, invoice_item["quantity"]
  end

  test "can find all invoice_items" do
    id = InvoiceItem.first.id
    quantity = InvoiceItem.first.quantity

    get :find_all, id: id, format: :json
    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, invoice_item.count
    assert_equal id, invoice_item.first["id"]
    assert_equal quantity, invoice_item.first["quantity"]
  end

  test "can find a random invoice_item" do
    get :random, format: :json
    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, invoice_item.class
    assert invoice_item.has_key?("id")
    assert invoice_item.has_key?("quantity")
  end
end
