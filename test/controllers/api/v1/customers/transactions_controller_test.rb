require 'test_helper'

class Api::V1::Customers::TransactionsControllerTest < ActionController::TestCase
  test "can visit index" do
    skip
    id = Customer.first.id
    transactions = Customer.first.transactions
    id = Customer.first.id

    # transaction = Transaction.first
    # invoice = Invoice.first << transaction
    # customer = Customer.first << invoice
    # transaction = customer.transaction

    get "index", id: id, transactions: transactions, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, parsed_json.count
    assert parsed_json.first.has_key?("status")
  end
end