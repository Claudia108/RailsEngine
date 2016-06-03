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

  test "returns paid invoices" do
    assert_equal 2, Invoice.paid.count
    assert_equal 1, Invoice.paid.first.id
    assert_equal 2, Invoice.paid.last.id
  end

  test "returns pending invoices" do
    assert_equal 1, Invoice.pending.count
    assert_equal 2, Invoice.pending.first.customer_id
    assert_equal 1, Invoice.pending.first.id
  end
end
