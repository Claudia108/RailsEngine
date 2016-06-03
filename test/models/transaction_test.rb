require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "returns a random transaction" do
    transaction = Transaction.random_dataset

    assert_equal Transaction, transaction.class
    assert transaction.id
    assert transaction.credit_card_number
    assert transaction.credit_card_expiration_date
    assert transaction.result
    assert transaction.invoice_id
    assert transaction.created_at
    assert transaction.updated_at
  end

end
