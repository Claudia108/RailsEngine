require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "can visit index" do
    get "index", format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, parsed_json.count
    assert parsed_json.first.has_key?("id")
    assert parsed_json.first.has_key?("status")
  end

  test "can visit show" do
    id = Invoice.first.id
    status = Invoice.first.status

    get :show, id: id, format: :json
    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal id, invoice["id"]
    assert_equal status, invoice["status"]
  end

  test "can find a single invoice" do
    id = Invoice.first.id
    status = Invoice.first.status

    get :find, id: id, format: :json
    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal id, invoice["id"]
    assert_equal status, invoice["status"]
  end

  test "can find all invoices" do
    id = Invoice.first.id
    status = Invoice.first.status

    get :find_all, id: id, format: :json
    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, invoice.count
    assert_equal id, invoice.first["id"]
    assert_equal status, invoice.first["status"]
  end

  test "can find a random invoice" do
    get :random, format: :json
    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, invoice.class
    assert invoice.has_key?("id")
    assert invoice.has_key?("status")
  end
end
