require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "returns a random invoice" do
    invoice = Invoice.random_dataset

    assert_equal Invoice, invoice.class
    assert invoice.id
    assert invoice.customer_id
    assert invoice.merchant_id
    assert invoice.status
    assert invoice.created_at
    assert invoice.updated_at
  end

end
