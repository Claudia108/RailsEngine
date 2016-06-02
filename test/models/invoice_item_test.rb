require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  test "can find a single invoice_item" do
    invoice_item = invoice_items(:one)
    id = invoice_item.id
    quantity = invoice_item.quantity
    invoice_id = invoice_item.invoice_id
    item_id = invoice_item.item_id
    unit_price = invoice_item.unit_price.to_f / 100
    created_at = invoice_item.created_at
    updated_at = invoice_item.updated_at

    invoice_item = InvoiceItem.match(id: id)
    assert_equal id, invoice_item["id"]
    assert_equal quantity, invoice_item["quantity"]

    invoice_item = InvoiceItem.match(quantity: quantity)
    assert_equal id, invoice_item["id"]
    assert_equal quantity, invoice_item["quantity"]

    invoice_item = InvoiceItem.match(item_id: item_id)
    assert_equal id, invoice_item["id"]
    assert_equal quantity, invoice_item["quantity"]

    invoice_item = InvoiceItem.match(unit_price: unit_price)
    assert_equal id, invoice_item["id"]
    assert_equal quantity, invoice_item["quantity"]

    invoice_item = InvoiceItem.match(invoice_id: invoice_id)
    assert_equal id, invoice_item["id"]
    assert_equal quantity, invoice_item["quantity"]

    invoice_item = InvoiceItem.match(created_at: created_at)
    assert_equal id, invoice_item["id"]
    assert_equal quantity, invoice_item["quantity"]

    invoice_item = InvoiceItem.match(updated_at: updated_at)
    assert_equal id, invoice_item["id"]
    assert_equal quantity, invoice_item["quantity"]
  end

  test "can find all invoice_items by different parameters" do
    invoice_item = invoice_items(:one)
    id = invoice_item.id
    invoice_id = invoice_item.invoice_id
    item_id = invoice_item.item_id
    unit_price = invoice_item.unit_price.to_f / 100
    quantity = invoice_item.quantity
    created_at = invoice_item.created_at
    updated_at = invoice_item.updated_at

    invoice_item = InvoiceItem.find_all(id: id)

    assert_equal 1, invoice_item.count
    assert_equal id, invoice_item.last["id"]
    assert_equal quantity, invoice_item.last["quantity"]

    invoice_item = InvoiceItem.find_all(quantity: quantity)

    assert_equal 1, invoice_item.count
    assert_equal id, invoice_item.last["id"]
    assert_equal quantity, invoice_item.last["quantity"]

    invoice_item = InvoiceItem.find_all(item_id: item_id)

    assert_equal 1, invoice_item.count
    assert_equal id, invoice_item.last["id"]
    assert_equal quantity, invoice_item.last["quantity"]

    invoice_item = InvoiceItem.find_all(unit_price: unit_price)

    assert_equal 1, invoice_item.count
    assert_equal id, invoice_item.last["id"]
    assert_equal quantity, invoice_item.last["quantity"]

    invoice_item = InvoiceItem.find_all(invoice_id: invoice_id)

    assert_equal 1, invoice_item.count
    assert_equal id, invoice_item.last["id"]
    assert_equal quantity, invoice_item.last["quantity"]

    invoice_item = InvoiceItem.find_all(created_at: created_at)

    assert_equal 2, invoice_item.count
    assert_equal id, invoice_item.last["id"]
    assert_equal quantity, invoice_item.last["quantity"]

    invoice_item = InvoiceItem.find_all(updated_at: updated_at)

    assert_equal 2, invoice_item.count
    assert_equal id, invoice_item.last["id"]
    assert_equal quantity, invoice_item.last["quantity"]
  end

  test "returns a random invoice_item" do
    invoice_item = InvoiceItem.random_dataset

    assert_equal InvoiceItem, invoice_item.class
    assert invoice_item.id
    assert invoice_item.quantity
    assert invoice_item.item_id
    assert invoice_item.unit_price
    assert invoice_item.invoice_id
    assert invoice_item.created_at
    assert invoice_item.updated_at
  end

end
