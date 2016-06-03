require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "can visit index" do
    get "index", format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 3, parsed_json.count
    assert parsed_json.first.has_key?("id")
    assert parsed_json.first.has_key?("credit_card_number")
  end

  test "can visit show" do
    id = Transaction.first.id
    credit_card_number = Transaction.first.credit_card_number

    get :show, id: id, format: :json
    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal id, transaction["id"]
    assert_equal credit_card_number, transaction["credit_card_number"]
  end

  test "can find a single transaction" do
    id = Transaction.first.id
    credit_card_number = Transaction.first.credit_card_number

    get :find, id: id, format: :json
    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal id, transaction["id"]
    assert_equal credit_card_number, transaction["credit_card_number"]
  end

  test "can find all transactions" do
    id = Transaction.first.id
    credit_card_number = Transaction.first.credit_card_number

    get :find_all, id: id, format: :json
    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, transaction.count
    assert_equal id, transaction.first["id"]
    assert_equal credit_card_number, transaction.first["credit_card_number"]
  end

  test "can find a random transaction" do
    get :random, format: :json
    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, transaction.class
    assert transaction.has_key?("id")
    assert transaction.has_key?("credit_card_number")
  end
end
